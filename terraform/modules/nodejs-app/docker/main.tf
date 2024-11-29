terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# resource "docker_image" "test" {
#   name = "build-test"
#   build{
#     context = "/var/jenkins_home/workspace/DevOpsProject"
#     dockerfile = "Dockerfile_node"
#     tag = ["build-test:latest"]
#     no_cache = true
#   }
# }
# Error msg: failed to read downloaded context: failed to load cache key: invalid response status 403

resource "docker_image" "nodeImg" {
  name = "localhost:5000/nodejs-sample-app"
}

resource "docker_container" "nodeCont" {
  name  = "nodejs-sample-app"
  image = docker_image.nodeImg.image_id

  ports {
    internal = 3000
    external = 3000
  }

  restart = "unless-stopped"
}
