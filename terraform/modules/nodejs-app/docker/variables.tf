variable "container_count" {
    description = "Number of containers."
    type = number
    default = 5
}

variable "container_name" {
    description = "Name of the container."
    type = string
}

variable "app_port" {
    description = "Application port."
    type = number
    default = 3000
}