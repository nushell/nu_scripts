# docker alias in nushell

This plugin adds the following aliases:

| Alias   | Command                           | Description                                                                              |
| ------- | --------------------------------- | ---------------------------------------------------------------------------------------- |
| dbl     | docker build                      | Build an image from a Dockerfile                                                         |
| dcin    | docker container inspect          | Display detailed information on one or more containers                                   |
| dcls    | docker container ls               | List all the running docker containers                                                   |
| dclsa   | docker container ls -a            | List all running and stopped containers                                                  |
| dib     | docker image build                | Build an image from a Dockerfile (same as docker build)                                  |
| dii     | docker image inspect              | Display detailed information on one or more images                                       |
| dils    | docker image ls                   | List docker images                                                                       |
| dipu    | docker image push                 | Push an image or repository to a remote registry                                         |
| dirm    | docker image rm                   | Remove one or more images                                                                |
| dit     | docker image tag                  | Add a name and tag to a particular image                                                 |
| dlo     | docker container logs             | Fetch the logs of a docker container                                                     |
| dnc     | docker network create             | Create a new network                                                                     |
| dncn    | docker network connect            | Connect a container to a network                                                         |
| dndcn   | docker network disconnect         | Disconnect a container from a network                                                    |
| dni     | docker network inspect            | Return information about one or more networks                                            |
| dnls    | docker network ls                 | List all networks the engine daemon knows about, including those spanning multiple hosts |
| dnrm    | docker network rm                 | Remove one or more networks                                                              |
| dpo     | docker container port             | List port mappings or a specific mapping for the container                               |
| dpu     | docker pull                       | Pull an image or a repository from a registry                                            |
| dr      | docker container run              | Create a new container and start it using the specified command                          |
| drit    | docker container run -it          | Create a new container and start it in an interactive shell                              |
| drm     | docker container rm               | Remove the specified container(s)                                                        |
| drm!    | docker container rm -f            | Force the removal of a running container (uses SIGKILL)                                  |
| dst     | docker container start            | Start one or more stopped containers                                                     |
| drs     | docker container restart          | Restart one or more containers                                                           |
| dstp    | docker container stop             | Stop one or more running containers                                                      |
| dtop    | docker top                        | Display the running processes of a container                                             |
| dvi     | docker volume inspect             | Display detailed information about one or more volumes                                   |
| dvls    | docker volume ls                  | List all the volumes known to docker                                                     |
| dvprune | docker volume prune               | Cleanup dangling volumes                                                                 |
| dxc     | docker container exec             | Run a new command in a running container                                                 |
| dxcit   | docker container exec -it         | Run a new command in a running container in an interactive shell                         |
| dsta    | docker ps -q \| xargs docker stop | Stop all running containers                                                              |

## install and use

- install

  ```nushell
  use {project_path}/aliases/docker/docker.nu
  ```

- use

  ```nushell
  docker-aliases + tab
  ```
