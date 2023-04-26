#!/bin/sh

swayidle -w -d \
	timeout 600 '~/.config/sway/scripts/lock.sh -f --grace 10 --fade-in 8' \
	# timeout 15 'systemctl suspend' \
	# timeout 900 'swaymsg "output 'Dell Inc. DELL U2913WM 5YD8C328433L' dpms off"' \
	# before-sleep 'pgrep swaylock || ~/.config/sway/scripts/lock.sh -f --fade-in 0 && true' \
	# resume 'swaymsg "output 'Dell Inc. DELL U2913WM 5YD8C328433L' dpms on"; sleep 2; swaymsg "output 'Dell Inc. DELL U2913WM 5YD8C328433L' enable"'

# *************************
# Idle configuration
# *************************

# Example configuration:

# exec swayidle -w \
#     timeout 30 'swaylock -f -c 000000' \
#     timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
#     before-sleep 'swaylock -f -c 000000'

# This will lock your screen after 300 seconds of inactivity, then turn off
# your displays after another 300 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.
