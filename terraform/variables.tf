variable "app_port" {
    description = "Application port."
    type = number
    default = 3000
}

# variables.tf
variable "project_name" {
  description = "Project name"
  type        = string
  default     = "myapp"
}
