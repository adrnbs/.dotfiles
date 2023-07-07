#!/bin/bash

flatpak override --user --env=OBSIDIAN_USE_WAYLAND=1 md.obsidian.Obsidian
export $(dbus-launch)
flatpak run md.obsidian.Obsidian
