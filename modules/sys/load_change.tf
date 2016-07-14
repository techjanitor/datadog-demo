variable "load_change_threshold_ok" {
  default = 60
}

variable "load_change_threshold_critical" {
  default = 80
}

resource "datadog_monitor" "load_change" {
  name = "[${var.service_name}] [SYS] load change"
  type = "query alert"
  message = "This tracks the change in 15 minute load for the service. ${var.notify}"

  query = "pct_change(min(last_${var.check_period}),${var.check_period}_ago):avg:system.load.15{${var.query_criteria}} > ${var.load_change_threshold_critical}"

  notify_no_data = false
  notify_audit = false
  timeout_h = 60
  include_tags = true

  thresholds {
    ok = "${var.load_change_threshold_ok}"
    warning = "${var.load_change_threshold_ok}"
    critical = "${var.load_change_threshold_critical}"
  }
}
