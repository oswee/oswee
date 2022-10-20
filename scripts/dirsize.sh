#!/bin/sh

if [ $# != 2 ]; then
  echo "Incorrect number of arguments !" >&2
  echo "USAGE: sortdirbysize [DIRECTORY] <first n directories>"
fi
du -h --max-depth=1 $1 2> /dev/null | sort -hr | tail -n +2 | head -$2
