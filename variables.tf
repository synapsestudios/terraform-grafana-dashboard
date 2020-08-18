variable "application_name" {
  type        = string
  description = "Name of application."
}

variable "datasource" {
  type        = string
  description = "Grafana Datasource name."
}

variable "environment_name" {
  type        = string
  description = "Name of environment."
}

variable "namespace" {
  type        = string
  description = "Namespace of environment."
}

variable "uid" {
  type        = string
  description = "UID of the grafana dashboard"
}

variable "panel_height" {
  type        = number
  description = "Height of dashboard panels."
  default     = 5
}

variable "panel_width" {
  type        = number
  description = "Width of dashboard panels."
  default     = 5
}

# TODO fix the types for the following variables.
variable "load_balancer_panels" {
  # type        = unknown?
  description = "List of load balancer panels in template form."
  default     = []
}

variable "rds_panels" {
  # type        = unknown?
  description = "List of RDS panels in template form."
  default     = []
}

variable "redis_panels" {
  # type        = unknown?
  description = "List of Redis panels in template form."
  default     = []
}

variable "es_panels" {
  # type        = unknown?
  description = "List of ElasticSearch panels in template form."
  default     = []
}

variable "ecs_panels" {
  # type        = list(any)
  description = "List of ECS panels in template form.."
  default     = []
}
