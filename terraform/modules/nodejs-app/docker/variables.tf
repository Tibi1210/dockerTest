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

variable "memory_limit" {
    description = "Application max usable memory."
    type = number
    default = 256
}

variable "healthcheck" {
  description = "Healthcheck settings"
  type = object({
    enabled = bool
    test = list(string)
    interval = string
    timeout = string
    retries = number
    start_period = string
  })
  default = {
    enabled = true
    test = ["CMD", "curl", "-f", "http://localhost:3000/add?num1=10&num2=20"]
    interval = "30s"
    timeout = "10s"
    retries = 3
    start_period = "40s"
  }
}