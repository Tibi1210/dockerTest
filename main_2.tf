terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "node_app" {
  name = "nodejs-sample-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_deploy-env"
    tag        = ["nodejs-sample-app:latest"]
  }
}

resource "docker_container" "node_app" {
  name  = "nodejs-sample-app"
  image = docker_image.node_app.image_id

  ports {
    internal = 3000
    external = 3000
  }

  restart = "unless-stopped"
}

