provider "google" {
    project = "cosmo-webdev"
    region  = var.region
    zone    = var.zone
}

resource "google_service_account" "service_account" {
    account_id   = "default"
    display_name = var.service_account
}

resource "google_compute_instance" "vm" {
    name         = var.instance_name
    machine_type = var.instance_type
    zone         = var.zone
    
    metadata_startup_script = file("./startup.sh")
    
    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2204-lts"
        }
    }

    scheduling {
        preemptible                 = true
        automatic_restart           = false
        provisioning_model          = "SPOT"
        instance_termination_action = "STOP"
    }

    network_interface {
        subnetwork = data.google_compute_subnetwork.defualt.id

        access_config {
            nat_ip = data.google_compute_global_address.external-ip.address
        }
    }
}

resource "google_compute_firewall" "vm-firewall" {
    name    = "vm-firewall"
    network = "default"
    allow {
        protocol = "tcp"
        ports    = ["80", "443", "22"]  
    }
    source_ranges = ["0.0.0.0/0"]
}