variable external_ip_app {
	description = "external_ip"
}

variable region {
	description = "Region"
	default = "europe-west1"
}

variable project {
	description = "Project ID"
}

variable public_key_path {
	description = "Path to public key used for ssh access"
}

variable disk_image {
	description = "Disk Image"
}
