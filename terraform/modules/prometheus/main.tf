# modules/prometheus/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "prometheus" {
  name = "localhost:5000/prometheus:latest"
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id

  ports {
    ip       = "0.0.0.0"
    internal = 9090
    external = 9090
  }

  networks_advanced {
    name = var.network
    ipv4_address = "172.18.0.6"
  }
}