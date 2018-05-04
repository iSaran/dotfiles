#!/bin/bash

## @author Iason Sarantopoulos

set -e

if [[ `lsb_release -rs` == "16.04" ]]
then
  echo "Installing packages in Ubuntu 16.04"
else
  echo "Error: The installation is only for Ubuntu 16.04. Exiting."
  exit 1
fi

sudo apt-get update
sudo apt-get install -y chromium-browser git vim git-gui indicator-multiload guake terminator gimp vlc inkscape kdenlive meshlab ffmpeg synaptic htop

