provider "google" {
    project = "cosmo-webdev"
    region = "europe-west4"
    zone = "europe-west4-a"
}

resource "google_service_account" "service_account" {
    account_id   = "default"
    display_name = var.service_account
}

resource "google_compute_instance" "vm1" {
    name = "vm1"
    machine_type = "e2-medium"
    zone = "europe-west4-a"
    

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