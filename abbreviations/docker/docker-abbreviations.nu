const docker_abbreviations = {
    dbl: "docker build"
    dcin: "docker container inspect"
    dcls: "docker container ls"
    dclsa: "docker container ls -a"
    dib: "docker image build"
    dii: "docker image inspect"
    dils: "docker image ls"
    dipu: "docker image push"
    dirm: "docker image rm"
    dit: "docker image tag"
    dlo: "docker container logs"
    dnc: "docker network create"
    dncn: "docker network connect"
    dndcn: "docker network disconnect"
    dni: "docker network inspect"
    dnls: "docker network ls"
    dnrm: "docker network rm"
    dpo: "docker container port"
    dpu: "docker pull"
    dr: "docker container run"
    drit: "docker container run -it"
    drm: "docker container rm"
    drm!: "docker container rm -f"
    dst: "docker container start"
    dsta: "docker ps -q | xargs docker stop"
    drs: "docker container restart"
    dstp: "docker container stop"
    dtop: "docker top"
    dvi: "docker volume inspect"
    dvls: "docker volume ls"
    dvprune: "docker volume prune"
    dxc: "docker container exec"
    dxcit: "docker container exec -it"
}

export-env {
    $env.config.abbreviations = {
        ...$docker_abbreviations
        ...$env.config.abbreviations
    }
}
