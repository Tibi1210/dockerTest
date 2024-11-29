terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "test" {
  name = "build-test"
  build{
    context = "."
    dockerfile = "Dockerfile_node"
    tag = ["build-test:latest"]
    no_cache = true
  }
}

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

# docker run -it -p 5000:5000 registry:2
# docker run -it --rm -p 8080:8080 -p 50000:50000 -v ./jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock my-jenkins