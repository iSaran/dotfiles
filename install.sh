#!/bin/bash 

set -e
DOTFILES_DIR=${PWD}
INSTALL_SCRIPTS_DIR=$DOTFILES_DIR/install
TIME=`date +%y%m%d_%H%M`
BACKUP_NAME=backup_$TIME
cd $DOTFILES_DIR
mkdir -p backups
cd backups
mkdir -p $BACKUP_NAME

cd $INSTALL_SCRIPTS_DIR
source main.sh

