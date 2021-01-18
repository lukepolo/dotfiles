#!/usr/bin/env bash
echo 'start osx/set-defaults.sh'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# hibernation
# 0 - suspend to RAM only (default on desktops)
# 1 - suspend to disk only
# 3 - suspend to disk + RAM (default on laptops)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

echo "Done. Note that some of these changes require a logout/restart to take effect."