provider "google" {
    project = "mineral-proton-386004"
    credentials = file("credentials.json")
    region = "us-central1"
    zone = "us-central1-c"
}

resource "google_compute_instance" "my_instance" {
    name = "terraform-instance"
    machine_type = "f1-micro"
    zone = "us-central1-a"
    allow_stopping_for_update = true

    boot_disk {
      initialize_params {
        image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230411"
      }
    }

    network_interface {
      network = "default"
      access_config {
      }
    }
}

resource "google_compute_network" "terraform_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
  name = "terraform-subnet"
  ip_cidr_range = "10.20.0.0/16"
}
