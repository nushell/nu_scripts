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

export def venv-is-active [] {
    '__auto_venv' in (overlay list)
}


export def has-entered-venv [
    after: path,
] {

    let target = (path find-sub $after $env.AUTO_VENV_TRIGGER)
    
    (if ($target | is-empty) {
        false
    }
    else {
        # if venv is already active, handle it in "venv swap" hook
        not (venv-is-active)
    })
}

export def has-swapped-venv [
    after: path,
] {

    (if not (venv-is-active) {
        false
    }
    else {
        let target = (path find-sub $after $env.AUTO_VENV_TRIGGER)
            
        (if ($target | is-empty) {
            false
        }
        else {
            (if ('VIRTUAL_ENV' in $env) {
		    $env.VIRTUAL_ENV != $target
		    } else {
		    false # should it default to `false`?
		    })
        })

    })
}

export def has-exited-venv [
    after: path,
] {

    (if not (venv-is-active) {
        false
    } 
    else {
        not (has-sub $after $env.AUTO_VENV_TRIGGER)
    })
}

