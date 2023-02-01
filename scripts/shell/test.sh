#!/bin/sh

full_path=$(realpath $0)

echo $(dirname $full_path)
