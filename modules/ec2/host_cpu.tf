variable "host_cpu_threshold_ok" {
  default = 80
}

variable "host_cpu_threshold_critical" {
  default = 90
}

resource "datadog_monitor" "host_cpu" {
  name = "[${var.service_name}] [EC2] host cpu utilization"
  type = "metric alert"
  message = "This tracks per-host CPU utilization over the past 15 minutes."

  query = "min(last_${var.check_period}):avg:aws.ec2.cpuutilization{${var.query_criteria}} by {name} > ${var.host_cpu_threshold_critical}"

  notify_no_data = false
  notify_audit = false
  timeout_h = 60
  include_tags = true

  thresholds {
    ok = "${var.host_cpu_threshold_ok}"
    warning = "${var.host_cpu_threshold_ok}"
    critical = "${var.host_cpu_threshold_critical}"
  }
}
