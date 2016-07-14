variable "datadog_api_key" {
  default = ""
}

variable "datadog_app_key" {
  default = ""
}

variable "notify" {
  default = "\n{{#is_alert}}Notify: @hipchat-Alerts{{/is_alert}}"
}
