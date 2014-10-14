#!/bin/sh

WALLPAPER_SETTING_DEFAULT=fill

bg_setting_get () {
	sed -n '
	/feh/ {
		s/^.*--bg-\([^ ]\+\).*$/\1/p;
	}'
}

bg_setting_set () {
	sh -c "$(sed -nf - $1 <<SED
	/feh/ {
		s/--bg-[^ ]\+/--bg-${2:-$WALLPAPER_SETTING_DEFAULT}/
		p
	}
SED
	)"
}

# checks for non-opt arguments
has_arg () {
	test -n "$(echo $@ | grep "\(^\|\s\)[^-]")"
}

wallpaper () {
	if [ $# -gt 0 ]
	then
		# ensure bg setting exists in arguments
		if [ -z "$(echo feh $@ | bg_setting_get)" ]
		then
			setting=--bg-"${WALLPAPER_SETTING:-$WALLPAPER_SETTING_DEFAULT}"
		fi

		if has_arg $@
		then
			feh $setting $@
		else
			feh $setting $@ "$(recent -n 1 $DOWNLOADS)"
		fi
	elif [ -e ~/.fehbg ]
	then
		if [ $(cat .fehbg | bg_setting_get) != "$WALLPAPER_SETTING" ]
		then
			bg_setting_set .fehbg $WALLPAPER_SETTING
		else
			./.fehbg
		fi
	else
		feh --bg-${WALLPAPER_SETTING:-$WALLPAPER_SETTING_DEFAULT} \
			"$(recent -n 1 $DOWNLOADS)"
	fi
}
