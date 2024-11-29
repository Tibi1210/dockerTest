terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

module "nodejs-app"{
  source = "./modules/nodejs-app/docker"

  app_port = var.app_port
  container_name = "nodejs-sample-app"
}