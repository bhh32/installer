#!/bin/bash -e

# No need for a password since the system will use the flatpak version.

# Install Zoom
flatpak install -y --user us.zoom.Zoom | grep -iv matches

