run_segment() {
	ICON_FAJR=""
	ICON_SUNRISE=""
	ICON_DHUHR="盛"
	ICON_ASR=""
	ICON_MAGHRIB=""
	ICON_ISHA=""

	ICONS=(${ICON_FAJR} ${ICON_SUNRISE} ${ICON_DHUHR} ${ICON_ASR} ${ICON_MAGHRIB} ${ICON_ISHA})

	COUNTRY="egypt"
	CITY="cairo"
	ENDPOINT="https://api.aladhan.com/v1/timingsByCity?city=${CITY}&country=${COUNTRY}&method=5"

	datestamp="$(date +%Y%m%d)"
	prayer_file="/tmp/prayer_${CITY}_${COUNTRY}_${datestamp}.dat"

	current_timestamp="$(date +%s)"

	# 1. Get prayer Times
	if [ ! -f $prayer_file ]; then
		prayers_data="$(curl -Lks "${ENDPOINT}")"
		code="$(echo ${prayers_data} | jq .code)"

		# Save prayers only if request succeeds
		if [ $code -eq 200 ]; then
			echo "${prayers_data}" >$prayer_file
		else
			return 1
		fi
	else
		prayers_data="$(cat ${prayer_file})"
	fi

	# 2. Parse prayer timings and titles
	prayers=($(echo "${prayers_data}" | jq -r ".data.timings[]"))
	prayer_titles=($(echo "${prayers_data}" | jq -r ".data.timings | keys_unsorted[]"))

	# 3. Remove Sunset, Midnight, Lasthird, Firstthird, and Imsak
	unset 'prayers[${#prayers[@]}-1]'
	unset 'prayers[${#prayers[@]}-1]'
	unset 'prayers[${#prayers[@]}-1]'
	unset 'prayers[${#prayers[@]}-1]'
	unset 'prayers[${#prayers[@]}-3]'

	unset 'prayer_titles[${#prayer_titles[@]}-1]'
	unset 'prayer_titles[${#prayer_titles[@]}-1]'
	unset 'prayer_titles[${#prayer_titles[@]}-1]'
	unset 'prayer_titles[${#prayer_titles[@]}-1]'
	unset 'prayer_titles[${#prayer_titles[@]}-3]'

	# 4. Shift arrays to fix indices
	prayers=("${prayers[@]}")
	prayer_titles=("${prayer_titles[@]}")

	# 5. Determine next prayer
	next_prayer=0
	for i in "${!prayers[@]}"; do
		timing=${prayers[$i]}
		timing_stamp=$(date -j -f "%H:%M" ${timing} +"%s")

		if [ $current_timestamp -ge $timing_stamp ]; then
			let next_prayer=${i}+1
			if [ $next_prayer -ge ${#prayers[@]} ]; then
				let next_prayer=0
			fi
		fi
	done

	# 6. Calculate time left till next prayer
	next_prayer_stamp=$(date -j -f "%H:%M" ${prayers[$next_prayer]} +%s)
	difference=$((next_prayer_stamp - current_timestamp))
	countdown=$(date -j -v"+$((difference))S" +"%H:%M")

	echo "${ICONS[$next_prayer]} ${prayer_titles[$next_prayer]} ${countdown}"

	return 0
}

"$@"
