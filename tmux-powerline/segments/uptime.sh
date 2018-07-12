# Prints the uptime.

run_segment() {
  uptime | sed 's/.*up /uptime: /' | sed 's/,.*$/h/'
	return 0
}
