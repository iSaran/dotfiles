#!/bin/bash

## @author Iason Sarantopoulos

MESSAGE="Configuring git"; blue_echo

sudo apt-get install -y git git-gui

###############################################################################
###                           Set up .tmux.conf                             ###
###############################################################################

cd $DOTFILES_DIR/git/diff-highlight
make

MESSAGE="Git configured successfully"; green_echo
