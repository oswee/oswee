#!/bin/bash

mkdir -p ~/code/github.com/derailed && cd ~/code/github.com/derailed

git clone https://github.com/derailed/k9s.git && cd ./k9s

make build

# Copy binary to the common path
cp ./execs/k9s ~/.local/bin
