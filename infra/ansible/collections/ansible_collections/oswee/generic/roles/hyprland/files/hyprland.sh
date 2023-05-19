#!/bin/sh

# Ideally you should avoid using ssh-agent. Look towards YubiKey GPG solution.
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"  # You can try to export thin. SSH agent should run before KeePass can inject keys.

## TODO: This should not be there. You can also use `LD_LIBRARY_PATH=/usr/local/lib/wlroots hyprwm`
## This path points to libdisplay_info.so library. `wlroots` is my custom ldconfig path directory where i place Hypr dependencies.
export LD_LIBRARY_PATH=/usr/local/lib/wlroots

DESKTOP_SESSION=Hyprland
XDG_CURRENT_DESKTOP=Hyprland
XDG_SESSION_DESKTOP=Hyprland
XDG_SESSION_TYPE=wayland

XKB_DEFAULT_LAYOUT=us

LIBSEAT_BACKEND=logind

QT_AUTO_SCREEN_SCALE_FACTOR=1
QT_QPA_PLATFORM="wayland;xcb"
# QT_QPA_PLATFORM=wayland-egl
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
QT_QPA_PLATFORMTHEME=qt5ct
# QT_WAYLAND_FORCE_DPI=physical

# MOZ_ENABLE_WAYLAND=1

_JAVA_AWT_WM_NONEREPARENTING=1

CLUTTER_BACKEND=wayland

SDL_VIDEODRIVER=wayland

# GDK_BACKEND="wayland,x11"
GDK_BACKEND=wayland

WLR_DRM_DEVICES=/dev/dri/card0

[ "$(tty)" = "/dev/tty1" ] && exec Hyprland
