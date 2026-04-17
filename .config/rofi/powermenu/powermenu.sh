#!/usr/bin/env bash
dir="$HOME/.config/rofi/powermenu"
theme='menu'
uptime_str="$(uptime -p | sed -e 's/up //g')"
lock="<span font_desc='Hack Nerd Font 44'></span>\n<span font_desc='Hack Nerd Font 12'>Lock</span>"
exit="<span font_desc='Hack Nerd Font 44'></span>\n<span font_desc='Hack Nerd Font 12'>Exit</span>"
suspend="<span font_desc='Hack Nerd Font 44'></span>\n<span font_desc='Hack Nerd Font 12'>Suspend</span>"
hibernate="<span font_desc='Hack Nerd Font 44'></span>\n<span font_desc='Hack Nerd Font 12'>Hibernate</span>"
reboot="<span font_desc='Hack Nerd Font 44'></span>\n<span font_desc='Hack Nerd Font 12'>Reboot</span>"
shutdown="<span font_desc='Hack Nerd Font 44' rise='-2000'></span>\n<span font_desc='Hack Nerd Font 12'>Shutdown</span>"
yes="  Yes"
no="  No"
confirm_cmd() {
	echo -e "$yes\n$no" | rofi -dmenu -p 'Confirmation' -theme "$dir/shared/confirm.rasi"
}
run_rofi() {
	echo -e "${lock}|${exit}|${suspend}|${hibernate}|${reboot}|${shutdown}" | rofi -dmenu -no-config -p "Up: $uptime_str" -sep '|' -eh 2 -markup-rows -theme "$dir/$theme.rasi"
}
run_cmd() {
	if [[ "$(confirm_cmd)" == "$yes" ]]; then
		case "$1" in
			--shutdown) systemctl poweroff ;;
			--reboot) systemctl reboot ;;
			--suspend) systemctl suspend ;;
			--hibernate) systemctl hibernate ;;
			--logout) swaymsg exit ;;
		esac
	fi
}
chosen="$(run_rofi)"
case "$chosen" in
    *Lock*) bash "$HOME/.config/sway/scripts/lockman.sh" ;;
    *Exit*) run_cmd --logout ;;
    *Suspend*) run_cmd --suspend ;;
    *Hibernate*) run_cmd --hibernate ;;
    *Reboot*) run_cmd --reboot ;;
    *Shutdown*) run_cmd --shutdown ;;
esac
