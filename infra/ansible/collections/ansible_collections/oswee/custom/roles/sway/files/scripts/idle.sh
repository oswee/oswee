#!/bin/sh

swayidle -w -d \
	timeout 600 '~/.config/sway/scripts/lock.sh -f --grace 10 --fade-in 8' \
	# timeout 900 'swaymsg "output * dpms off"' \
	# timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
	# resume 'swaymsg "output * dpms on"; sleep 2; swaymsg "output * enable"' \
	# before-sleep 'pgrep swaylock || ~/.config/sway/lock.sh -f --fade-in 0 && true'
	# unlock 'pulseaudio -k'

