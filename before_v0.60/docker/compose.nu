# stops all running containers via their compose files
def compose [] {
  docker ps|
  each {
    docker inspect $it.ID|
    get Config.Labels|
    select 'com.docker.compose.project.working_dir' 'com.docker.compose.project.config_files'|
    rename dir file
    }|
    uniq|
    each {
      docker-compose -f (build-string $it.dir '/' $it.file) down
      }
}
