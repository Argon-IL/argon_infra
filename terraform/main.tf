terraform {
	required_version = "0.12.26"
}

provider "google" {
	version = "2.5.0"
	project = "${var.project}"
	region = "${var.region}"
}

resource "google_compute_instance" "app" {
	name = "reddit-app"
	machine_type = "g1-small"
	zone = "europe-west1-b"
	tags = ["reddit-app"]

	connection {
	type = "ssh"
	user = "testuser"
	agent = false
	host = "${self.network_interface.0.access_config.0.nat_ip}"
	private_key = "${file("~/.ssh/32")}"
	}

	boot_disk {
		initialize_params {
			image = "reddit-base"
		}
	}

	network_interface {

		network = "default"

		access_config {}
	}

	metadata = {

	ssh-keys = "testuser:${file(var.public_key_path)}"

	}

	provisioner "file" {
		source = "files/puma.service"
		destination = "/tmp/puma.service"
	}

	provisioner "remote-exec" {
	script = "files/deploy.sh"
	}
}

resource "google_compute_firewall" "firewall_puma" {

	name = "allow-puma-default"
	network = "default"

	allow {
		protocol = "tcp"
		ports = ["9292"]
	}

	source_ranges = ["0.0.0.0/0"]

	target_tags = ["reddit-app"]

}
