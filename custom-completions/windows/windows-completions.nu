export module win {

    # open in visual studio
    export def "open in visual-studio" [file: path] {
        let vswhere = $'($env."ProgramFiles(x86)")\Microsoft Visual Studio\Installer\vswhere.exe'
        if not ($vswhere | path exists) { error make {msg: $"($vswhere) not found" } }

        # https://github.com/microsoft/vswhere/wiki/Find-VC
        let latest = ^$vswhere -latest | parse "{property}: {value}"
        let installation_path = $latest | transpose --header-row | get installationPath.0
        let vs = $'($installation_path)\Common7\IDE\devenv.exe'
        if not ($vs | path exists) { error make {msg: $"($vs) not found" } }

        run-external $vs /Edit ($file | path expand)
    }

    # file version and signature viewer from file
    export def "read version" [file: path] {
        ^sigcheck -nobanner $file | lines | skip 1 | parse --regex '\s*(?<name>.+?):(?<value>.+)'
    }

    # application for CPU spikes, unhandled exception and hung window monitoring cli tool
    #
    # https://learn.microsoft.com/en-us/sysinternals/downloads/procdump#using-procdump
    #
    # Examples:
    #   Install ProcDump as the (AeDebug) postmortem debugger:
    #   procdump -ma -i c:\dumps
    #
    #   Uninstall ProcDump as the (AeDebug) postmortem debugger:
    #   procdump -u
    export extern "procdump" [ ...args: any ]

    # list logical disks somehing akin to unix's df command
    export def "disk free" [] {
        (wmic logicaldisk get deviceid,size,freespace,volumename,description | str trim
            | detect columns
            | insert Use% { ($in.freespace|into int) / ($in.size|into int) * 100 }
        )
    }

}
