data "google_compute_subnetwork" "defualt" {
    name = "default"
    region = "europe-west4"
}

data "google_compute_network" "vpc_network" {
    name = "default"
}

data "google_compute_global_address" "external-ip" {
  project      = "cosmo-webdev"
  name         = "ipv4-address"
}