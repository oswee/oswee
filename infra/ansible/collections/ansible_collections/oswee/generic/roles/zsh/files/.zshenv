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

