# variables.tf
variable "project_name" {
  description = "Project name foe the apps"
  type = string
  default = "nodejs-sample"
}

variable "app_port" {
  description = "Node app port"
  type = number
  default = 3000
}
