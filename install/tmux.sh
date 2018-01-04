#!/bin/bash

## @author Iason Sarantopoulos

echo "   Configuring tmux..."

echo "     Checking ~/.tmux.conf"
if [ -f ~/.tmux.conf ]; then
  echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
  mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
else
  if [ -L ~/.tmux.conf ]; then 
    echo "       Existing tmux.conf found"
    if [ -h ~/.tmux.conf ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      echo "       Existing symlink found. Deleted it."
      rm ~/.tmux.conf
    else
      # It's a file!  # Directory command goes here.
      echo "       Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
      mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
    fi
  fi
fi

echo "     Creating a new symlink ~/.tmux.conf"
ln -s "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf

