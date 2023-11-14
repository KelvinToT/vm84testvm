terraform {
      required_providers {
        google = {
          source = "hashicorp/google"
          version = "4.51.0"
        }
      }
    }
    
    provider "google" {
        version = "4.51.0"
        credentials = file("/Users/johnf/School/learn-terraform-gcp/terraform-gcp-test-12345-37f477c5d787.json")
        project = "terraform-gcp-test-12345"
        region = "us-central1"
        zone = "us-central1-a"
    }
    
    data "google_compute_network" "my-network78933" {
        name = "my-network78933"
        }

    resource "google_compute_instance" "vm_instance" {
        name = "vm84testvm"
        machine_type = "e2-small"
        zone = "us-central1-a"
        
        boot_disk {
            initialize_params {
            image = "centos-cloud/centos-7"
        }
    }

    network_interface {
      network = data.google_compute_network.my-network78933.name
      access_config {
        }
    }
    }