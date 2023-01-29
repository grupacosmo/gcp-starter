variable "region" {
    type = string
    default = "europe-west4"
}

variable "zone" {
    type = string
    default = "europe-west4-a"
}

variable "instance_name" {
    type = string
    default = "vm-v1"
}

variable "instance_type" {
    type = string
    default = "e2-medium"
}

variable "service_account" {
    type = string
    default = "990794586294-compute@developer.gserviceaccount.com"
}