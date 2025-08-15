#!/bin/bash

# Get the active window's name
window_name=$(xdotool getactivewindow getwindowname 2>/dev/null)

# Check if the window name was retrieved successfully
if [ $? -ne 0 ] || [ -z "$window_name" ]; then
    echo "  I3wm"  # Default icon for no active window
    exit 1
fi

# Map window names to icons
case "$window_name" in
    *Firefox*)
        icon="󰈹"  # Firefox icon
        ;;
    *Kitty* | *Terminal* | *zsh* | *sejjy@archlinux* | *~*)
        icon=""  # Terminal icon for Kitty
        ;;
    *nvim*)
        icon=""  # Neovim icon
        ;;
    *vim*)
        icon=""  # Vim icon
        ;;
    *Godot*)
        icon=""  # Godot Engine icon
        ;;
    *Spotify*)
        icon=""  # Spotify icon
        ;;
    *VLC*)
        icon="󰕼"  # VLC Media Player icon
        ;;
    *mpv*)
        icon=""  # mpv icon
        ;;
    *qView*)
        icon=""  # qView icon
        ;;
    *Discord*)
        icon=""  # Discord icon
        ;;
    *ONLYOFFICE*)
        icon=""  # OnlyOffice icon
        ;;
    *.*)
        # Handle document icons
        case "$window_name" in
            *.docx) icon="" ;;  # Word document
            *.xlsx) icon="" ;;  # Excel document
            *.pptx) icon="" ;;  # PowerPoint document
            *.pdf)  icon="" ;;  # PDF document
            *.jpg)  icon="" ;;  # JPG image
            *.png)  icon="" ;;  # PNG image
            *.svg)  icon="" ;;  # SVG image
            *) icon="" ;;  # Default icon for unknown applications
        esac
        ;;
    *)
        icon=" "  # Default icon for unknown applications
        ;;
esac




# Output the icon and the window title
echo "$icon $window_name"

