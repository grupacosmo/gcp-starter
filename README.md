# gcp-starter

## Basic quality of life

### Create custom network and connection with firewall rules (TODO):

resource "google_compute_global_address" "external-ip" {
  project      = "cosmo-webdev"
  name         = "ipv4-address"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
}

resource "google_compute_network" "vpc_network" {
    name = "custom-network"
    auto_create_subnetworks = false
    mtu = 1500
}

resource "google_compute_subnetwork" "defualt" {
    name = "custom-subnet"
    ip_cidr_range = "10.0.1.0/24"
    region = "europe-west4"
    network = google_compute_network.vpc_network.id
}

### Receive address:

data "google_compute_global_address" "external-ip" 
    project      = "cosmo-webdev"
}


## Basic flow:

terraform init
terraform validate
terraform apply