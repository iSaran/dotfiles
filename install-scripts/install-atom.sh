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

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom
