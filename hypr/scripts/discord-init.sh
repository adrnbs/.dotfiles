#!/bin/bash

export $(dbus-launch)
flatpak run com.discordapp.Discord
