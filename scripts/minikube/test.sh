#!/bin/sh

echo "Server uptime is:" $(uptime)

script_path=$(realpath $0)
dir_path=$(dirname $script_path)

source $dir_path/echo.sh
