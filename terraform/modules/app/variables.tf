
variable zone {
	description = "Instance zone"
}

variable public_key_path {
	description = "Path to public key used for ssh access"
}

variable app_disk_image {
	description = "Disk image for reddit app"
	default = "reddit-app-base"
}