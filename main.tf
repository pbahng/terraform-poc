variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "deployment_identifier" {
  description = "The unique name for your instance"
  type        = string
}

resource "google_compute_instance" "default" {
  name         = "vm-${var.deployment_identifier}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    device_name = "boot"
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
