variable "service_name" {}

variable "query_criteria" {}

variable "check_period" {
  default = "5m"
}

variable "notify" {
  default = "\n{{#is_alert}}Notify: @hipchat-Alerts{{/is_alert}}"
}
