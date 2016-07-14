# service one

variable "service_one_service_name" {
  default = "service_one"
}

variable "service_one_query_criteria" {
  default = "environment:prod,service_name:service_one"
}

module "service_one_ec2" {
    source = "modules/ec2"
    service_name = "${var.service_one_service_name}"
    query_criteria = "${var.service_one_query_criteria}"

    host_cpu_threshold_ok = 20
    host_cpu_threshold_critical = 40
}

module "service_one_sys" {
    source = "modules/sys"
    service_name = "${var.service_one_service_name}"
    query_criteria = "${var.service_one_query_criteria}"
}
