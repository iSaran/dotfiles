#!/bin/bash

## @author Iason Sarantopoulos

MESSAGE="Configuring tmux"; blue_echo

sudo apt-get install -y tmux

###############################################################################
###                           Set up .tmux.conf                             ###
###############################################################################

if [ -f ~/.tmux.conf ]; then
  mkdir -p $BACKUP_DIR/tmux
  mv ~/.tmux.conf $BACKUP_DIR/tmux/tmux.conf
else
  if [ -L ~/.tmux.conf ]; then
    if [ -h ~/.tmux.conf ]; then
      rm ~/.tmux.conf
    else
      mkdir -p $BACKUP_DIR/tmux
      mv ~/.tmux.conf $BACKUP_DIR/tmux.conf
    fi
  fi
fi

ln -s $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf

MESSAGE="Tmux configured successfully"; green_echo
