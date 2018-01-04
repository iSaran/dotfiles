#!/bin/bash

## @author Iason Sarantopoulos

MESSAGE="Configuring my bashrc"; blue_echo

# Edit bashrc in order to source my bashrc.
# Any further change will be added to mybashrc
# keeping original bashrc untouched.
sed -i '/Iason Dotfiles/d' ~/.bashrc

# Adding a new instance for exporting DOTFILES_DIR var
echo "DOTFILES_DIR=$DOTFILES_DIR # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

# Adding a new instance for sourcing mybashrc
echo "" >> ~/.bashrc
echo "# Iason Dotfiles: Source mybashrc" >> ~/.bashrc
echo "if [ -f $DOTFILES_DIR/bash/mybashrc ]; then # Iason Dotfiles" >> ~/.bashrc
echo "    . $DOTFILES_DIR/bash/mybashrc # Iason Dotfiles" >> ~/.bashrc
echo "fi # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

MESSAGE="My bashrc configuration installed successfully"; green_echo
