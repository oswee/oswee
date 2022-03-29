# TODO: All specific env's should be moved to respective roles and injected when role is executed
# Neovim
export VISUAL=nvim
export EDITOR="$VISUAL"

# GitHub
export GITHUB_NPM_PAT=''

# GPG
export GPG_TTY=$(tty)

# Golang
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/go

# Bin
export LOCAL_BIN=$HOME/.local/bin
export YARN_BIN=$HOME/.yarn/bin

# FIXME: Waz iz zas?
export YARN_GLOBAL_BIN=$HOME/.config/yarn/global/node_modules/.bin

# Path
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN:$LOCAL_BIN:$YARN_BIN

# Ansible
export PY_COLORS=1  # Enable terminal output colors
