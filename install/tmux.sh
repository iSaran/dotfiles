#!/bin/bash

## @author Iason Sarantopoulos

MESSAGE="Configuring tmux"; blue_echo

sudo apt-get install -y tmux

###############################################################################
###                           Set up .tmux.conf                             ###
###############################################################################

if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf $BACKUP_DIR/tmux/tmux.conf
fi

ln -s $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf

MESSAGE="Tmux configured successfully"; blue_echo
