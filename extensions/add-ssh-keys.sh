function extension_prepare_config__prepare_ssh_keys() {
	display_alert "SSH Keys extension enabled" "${EXTENSION}" "info"
}

function pre_customize_image__005_add_ssh_keys() {
	display_alert "Deploying SSH keys" "${EXTENSION}" "info"
	mkdir -p "${SDCARD}/root/.ssh"
	cat <<- EOD >> "${SDCARD}/root/.ssh/authorized_keys"
		ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMsOsw5UHKCSWP4MrZUM2iBUs+i2yeOTtdRSTr2U1nKt epic example key
		ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMktALnxSFInb/qK8VNwoy6mvnyk+42mM2XoChb+Xpo regular example key
	EOD
	chroot_sdcard chmod -v -R u+rw,o-rwx,g-rwx "/root/.ssh"
}
