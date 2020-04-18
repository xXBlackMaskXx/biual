#!/bin/sh

# To change from World stats to your country, create ~/.config/covid-19/location
# with a name of your country

download() {
	location="countries/$(cat ~/.config/covid-19/location 2>/dev/null)" || location="all"
	stats="$(curl -s "https://corona.lmao.ninja/v2/$location")"
	# Sometimes website doesn't work and will return Cloudflare HTML, which
	# will cause `jq` to fail and show error, instead we are going to return
	# and not replace saved stats on the disk
	active="$(echo "$stats" | jq '.active' 2>/dev/null)" || return
	todaycases="$(echo "$stats" | jq '.todayCases')"
	deaths="$(echo "$stats" | jq '.deaths')"
	recovered="$(echo "$stats" | jq '.recovered')"
	echo " $active  $todaycases  $deaths  $recovered" > ~/.cache/covid-19
}

if [ -f ~/.cache/covid-19 ]; then
	modified="$(stat -c '%Y' ~/.cache/covid-19)"
	current="$(date +%s)"
	change=$((current - modified))
	curl https://corona.lmao.ninja >/dev/null 2>&1 && [ $change -gt 3600 ] && download
else
	download
fi

cat ~/.cache/covid-19
