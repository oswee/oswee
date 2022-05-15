# TODO: All specific env's should be moved to respective roles and injected when role is executed
# Neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# Bin
export LOCAL_BIN=$HOME/.local/bin

# Path
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN:$LOCAL_BIN

# Ansible
export PY_COLORS=1  # Enable terminal output colors

#QT

export QT_QPA_PLATFORMTHEME="qt5ct"

# Wayland
export QT_QPA_PLATFORM=Wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_SESSION_TYPE=wayland
export GDG_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND=1
