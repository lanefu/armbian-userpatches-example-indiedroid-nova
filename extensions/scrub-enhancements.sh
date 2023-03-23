function post_family_tweaks_bsp__scrub_enhancements() {
	display_alert "Removing stuff from BSP" "${EXTENSION}" "warn"

	# Lets obliterate stuff in mass from the bsp, no autologin, no firstrun
	find "$destination" -type f | grep \
		-e "zram" \
		-e "periodic" \
		-e "profile-sync-daemon" \
		-e "logrotate" \
		-e "ramlog" | xargs rm

	display_alert "Hacking at the BSP" "removing enhancements" "info"
	# remove a bunch of stuff from bsp so it behaves more like regular ubuntu
	RM_OPTIONS="-f"
	rm ${RM_OPTIONS} "$destination"/etc/apt/apt.conf.d/02-armbian-compress-indexes

	rm ${RM_OPTIONS} "$destination"/etc/cron.d/armbian-truncate-logs
	rm ${RM_OPTIONS} "$destination"/etc/cron.d/armbian-updates
	rm ${RM_OPTIONS} "$destination"/etc/cron.daily/armbian-ram-logging

	rm ${RM_OPTIONS} "$destination"/etc/default/armbian-ramlog.dpkg-dist
	rm ${RM_OPTIONS} "$destination"/etc/default/armbian-zram-config.dpkg-dist

	rm ${RM_OPTIONS} "$destination"/etc/lib/systemd/system/armbian-ramlog.service
	rm ${RM_OPTIONS} "$destination"/etc/lib/systemd/system/armbian-zram-config.service

	rm ${RM_OPTIONS} "$destination"/lib/systemd/system/armbian-zram-config.service
	rm ${RM_OPTIONS} "$destination"/lib/systemd/system/armbian-disable-autologin.service
	rm ${RM_OPTIONS} "$destination"/lib/systemd/system/armbian-ramlog.service

	return 0
}
