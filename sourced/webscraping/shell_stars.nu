let shell_list = [
    [name repo];
    [bash bminor/bash]
    [fish fish-shell/fish-shell]
    [nushell nushell/nushell]
    # [powershell no-github-url]
    [pwsh PowerShell/PowerShell]
    [ksh2020 ksh2020/ksh]
    [ksh93u att/ast]
    # [csh no-github-url]
    # [dash no-github-url]
    # [sh no-github-url]
    # [cmd no-github-url]
    [aws-shell awslabs/aws-shell]
    [azure-cloud-shell Azure/CloudShell]
    [elvish elves/elvish]
    [es wryun/es-shell]
    [ion redox-os/ion]
    [MirBSDksh MirBSD/mksh]
    [ngs ngs-lang/ngs]
    [openbsd_ksh ibara/oksh]
    [oil oilshell/oil]
    [shell++ alexst07/shell-plus-plus]
    [tcsh tcsh-org/tcsh]
    [xonsh xonsh/xonsh]
    [yash magicant/yash]
    [zsh zsh-users/zsh]
]

$shell_list | each { |r|
    print -n $"Working on ($r.name)"
    sleep 250ms
    if ($r.repo | str starts-with no) {
        [[shell repo stars]; [($r.name) "no github url" 0]]
        print ""
    } else {
        let url = $"https://api.github.com/repos/($r.repo)"
        let count = (http get -u $env.GITHUB_USERNAME -p $env.GITHUB_PASSWORD ($url) | get stargazers_count)
        print $" ($count)"
        [[shell repo stars]; [($r.name) ($r.repo) ($count)]]
    }
} | flatten | sort-by -r stars | table --index 1
