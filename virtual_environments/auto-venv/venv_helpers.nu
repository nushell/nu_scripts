use path_extensions.nu *

def has-sub [
    folder:    string, 
    subfolder: string
] {
    not (path find-sub $folder $subfolder | is-empty);
}

def get-env [
    name:    string
    default: any
] {
    (if ($name in $env) {
        $env | get $name
    }
    else {
        $default
    })
}

export def venv-is-active [
    module_name: string,
] {
    $module_name in (overlay list)
}


export def has-entered-venv [
    after:          path,
    trigger_folder: string,
    module_name:    string,
] {

    "" | save C:\Temp\we_made_it.debug 

    let target = path find-sub $after $trigger_folder
    
    (if ($target | is-empty) {
        false
    }
    else {
        # if venv is already active, handle it in "venv swap" hook
        not (venv-is-active $module_name)
    })
}

export def has-swapped-venv [
    after:          path,
    trigger_folder: string,
    module_name:    string,
] {

    (if not (venv-is-active $module_name) {
        false
    }
    else {
        let target = path find-sub $after $trigger_folder
            
        (if ($target | is-empty) {
            false
        }
        else {
            $env.VIRTUAL_ENV != $target
        })

    })
}

export def has-exited-venv [
    after:          path,
    trigger_folder: string,
    module_name:    string,
] {

    (if not (venv-is-active $module_name) {
        false
    } 
    else {
        not (has-sub $after $trigger_folder)
    })
}


# Builds and returns the `env_change` hooks 
# Note: (does not upsert config)
export def build-hooks [
    trigger_folder: string, # the folder that triggers the activation of the virtual env
    module_name:    string, # the nu module responsible for handling the environ variables
    pre_enter:      string, # nu code that runs in the hook, before the overlay is enabled
    activate:       string, # nu code that runs in the hook, after the overlay is enabled
] {

    # print 'building venv'

    # should point to the auto-venv/venvs folder
    let module_path = $env.AUTO_VENV_MODULES_DIR

    let module = ([ $module_path, $module_name ] | path join) + '.nu'

    let on_enter = '
        let _env = $env

        __pre_enter__

        overlay use __module__ as __module_name__

        # hooks dont self-trigger
        cd ($_env.PWD)

        __activate__

        hide _env
    '

    let on_exit = '
        overlay hide __module_name__ --keep-env [PWD]
    '

    let on_enter = ($on_enter | str replace '__pre_enter__'   $pre_enter)
    let on_enter = ($on_enter | str replace '__module__'      $module)
    let on_enter = ($on_enter | str replace '__module_name__' $module_name)
    let on_enter = ($on_enter | str replace '__activate__'    $activate)
    let on_exit  = ($on_exit  | str replace '__module_name__' $module_name)

    # must be a closure to pass values
    def-env _has_entered [after] {
        do { has-entered-venv $after $trigger_folder $module_name }
    }


    let hook = [
        # activate on entry
        {
            condition: {|before, after| has-entered-venv $after $trigger_folder $module_name}
            code: '
                print "hiya"
            '
            # code: $'
            #     ($on_enter)
            #     '
        }

        # # re-activate on swap
        # {
        #     condition: {|before, after| has-swapped-venv $after $trigger_folder $module_name}
        #     code: $'
        #         ($on_exit)
        #         ($on_enter)
        #     '
        # }

        # # deactivate on exit
        # {
        #     condition: { |before, after| has-exited-venv $after $trigger_folder $module_name }
        #     code: $'
        #         ($on_exit)
        #     '
        # }
    ]

    $hook
}

