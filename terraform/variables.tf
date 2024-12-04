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

variable "graylog_password_secret" {
  description = "Graylog password secret"
  type        = string
  sensitive   = true
}

variable "graylog_root_password_sha2" {
  description = "Graylog root jelszó SHA-256 hash-e"
  type        = string
  sensitive   = true
}