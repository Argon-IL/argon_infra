variable external_ip_app {
	description = "external_ip"
}

variable region {
	description = "Region"
	default = "europe-west1"
}

variable zone {
	description = "Instance zone"
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

variable app_disk_image {
	description = "Disk image for reddit app"
	default = "reddit-app-base"
}

variable db_disk_image {
	description = "Disk image for reddit db"
	default = "reddit-db-base"
}

