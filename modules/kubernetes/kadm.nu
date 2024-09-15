export def "kadm update certs" [] {
    sudo kubeadm certs check-expiration
    if ([n y] | input list 'renew all') == 'y' {
        sudo kubeadm certs renew all
    }
}
