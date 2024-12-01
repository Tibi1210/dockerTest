variable "network" {
  description = "Docker network"
  type = string
}

variable "nodejs_app_name" {
  description = "NodeJS container name"
  type = string
}


variable "app_port" {
  description = "NodeJS app port"
  type = number
  default = 3000
}