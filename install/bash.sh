#!/bin/bash

# Edit bashrc in order to source my bashrc.
# Any further change will be added to mybashrc
# keeping original bashrc untouched.
MESSAGE="Editing ~/.bashrc: Source mybashrc..."; blue_echo
MESSAGE="Remove previous instances of sourcing mybashrc"; blue_echo
sed -i '/Iason Dotfiles/d' ~/.bashrc  

MESSAGE="Adding a new instance for exporting DOTFILES_DIR var"; blue_echo
echo "DOTFILES_DIR=$DOTFILES_DIR # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc

MESSAGE="Adding a new instance for sourcing mybashrc"; blue_echo
echo "" >> ~/.bashrc
echo "# Iason Dotfiles: Source mybashrc" >> ~/.bashrc
echo "if [ -f $DOTFILES_DIR/bash/mybashrc ]; then # Iason Dotfiles" >> ~/.bashrc
echo "    . $DOTFILES_DIR/bash/mybashrc # Iason Dotfiles" >> ~/.bashrc
echo "fi # Iason Dotfiles" >> ~/.bashrc
echo "" >> ~/.bashrc
