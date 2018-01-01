MESSAGE="Configuing tmux..."; blue_echo

if [ -f ~/.tmux.conf ]; then
  MESSAGE="Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"; blue_echo
  mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
else
  if [ -L ~/.tmux.conf ]; then 
    MESSAGE="Existing tmux.conf found"; blue_echo
    if [ -h ~/.tmux.conf ]; then
      # It is a symlink!  # Symbolic link specific commands go here.
      MESSAGE="Existing symlink found. Deleted it."; blue_echo
      rm ~/.tmux.conf
    else
      # It's a file!  # Directory command goes here.
      MESSAGE="Existing file found. Moving it to $DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"; blue_echo
      mv ~/.tmux.conf "$DOTFILES_DIR/backups/$BACKUP_NAME/tmux.conf"
    fi
  fi
fi
ln -s "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
