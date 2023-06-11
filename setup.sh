#!/usr/bin/env bash

if [[ $OSTYPE == 'darwin'* ]]; then
  script_os=MacOS
  script_pm=brew
else
  script_os=Linux
  script_pm=apt
fi

echo "Detected $script_os. Starting setup..."
echo "- package manager: $script_pm"

printf "\nTesting root access...\n"

sudo -v
# keep-alive: update existing sudo time stamp if set, otherwise do nothing
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &