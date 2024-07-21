export alias dbl = docker build
export alias dcin = docker container inspect
export alias dcls = docker container ls
export alias dclsa = docker container ls -a
export alias dib = docker image build
export alias dii = docker image inspect
export alias dils = docker image ls
export alias dipu = docker image push
export alias dirm = docker image rm
export alias dit = docker image tag
export alias dlo = docker container logs
export alias dnc = docker network create
export alias dncn = docker network connect
export alias dndcn = docker network disconnect
export alias dni = docker network inspect
export alias dnls = docker network ls
export alias dnrm = docker network rm
export alias dpo = docker container port
export alias dpu = docker pull
export alias dr = docker container run
export alias drit = docker container run -it
export alias drm = docker container rm
export alias drm! = docker container rm -f
export alias dst = docker container start
export alias drs = docker container restart
export alias dstp = docker container stop
export alias dtop = docker top
export alias dvi = docker volume inspect
export alias dvls = docker volume ls
export alias dvprune = docker volume prune
export alias dxc = docker container exec
export alias dxcit = docker container exec -it

# Alias for `docker ps -q | xargs docker stop`
export def dsta [] {
    docker ps -q | xargs docker stop 
}