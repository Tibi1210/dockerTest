terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "node_app" {
  name = "nodejs-sample-app"
  build {
    context    = "."
    dockerfile = "Dockerfile"
    tag        = ["nodejs-sample-app:latest"]
  }
}
