# service two

variable "service_two_service_name" {
  default = "service_two"
}

variable "service_two_query_criteria" {
  default = "environment:prod,service_name:service_two"
}

module "service_two_ec2" {
    source = "modules/ec2"
    service_name = "${var.service_two_service_name}"
    query_criteria = "${var.service_two_query_criteria}"
}

module "service_two_sys" {
    source = "modules/sys"
    service_name = "${var.service_two_service_name}"
    query_criteria = "${var.service_two_query_criteria}"
}
