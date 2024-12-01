variable "container_name" {
  description = "Container name"
  type = string
}

variable "app_port" {
  description = "App port"
  type = number
  default = 3000
}

variable "container_count" {
  description = "Num of containers to run"
  type = number
  default = 4
}

variable "memory_limit" {
  description = "Mem limit in MB"
  type = number
  default = 256
}

variable "restart_policy" {
  description = "Restart type"
  type = string
  default = "unless-stopped"  # always, on-failure, unless-stopped
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

variable "network" {
  description = "Docker network"
  type = string
  default = "nodejs-sample-network"
}
