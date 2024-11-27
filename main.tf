terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

resource "docker_image" "python" {
  name = "python"
  build {
    context    = "."
    dockerfile = "Dockerfile_py"
    tag        = ["python:latest"]
  }
}
