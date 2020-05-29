variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
}

variable "cluster_name" {
  description = "Name of the ECS cluster this alarm is monitoring"
}

variable "alarm_type" {
  description = "A predefined string used to reference alarm templates"
}

variable "evaluation_periods" {
  description = "Number of intervals used to evaluate alarm metrics"
  type        = number
  default     = 1
}

variable "threshold" {
  description = "Alarm threshold value for evaluating metrics"
  type        = number
  default     = 50
}

variable "alarm_actions" {
  description = "A list of ARNs triggered when alarm transitions to ALARM state"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "A list of ARNs triggered when alarm transitions to OK state"
  type        = list(string)
  default     = []
}
