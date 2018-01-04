#!/bin/bash

## @author Iason Sarantopoulos

# The directory of the dotfiles
DOTFILES_DIR=$PWD

# The directory of the installation scripts
INSTALL_SCRIPTS_DIR=$DOTFILES_DIR/install

# The version of the ranger app to download and install
RANGER_VERSION=1.8.1

# Variables for the backup directory
TIME=`date +%y%m%d_%H%M`
BACKUP_NAME=backup_$TIME
BACKUP_DIR=$DOTFILES_DIR/backups/$BACKUP_NAME
