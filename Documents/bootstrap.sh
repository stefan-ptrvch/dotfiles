#!/usr/bin/env bash

# Update keys (maybe remove for non-vm)
# sudo pacman-key --refresh-keys

# Needs to be done manually:
#   -set lxappearance fonts and themes
#   -compile YCM with ./install.py --clang-completer --system-libclang
#   -Anaconda3
#   -Viber
#   -skypeforlinux
#   -dtrx
#   -fontawesome (smthn with github; not sure if I need it)
#   -mpdscribble
#   -siji (if fontawesome icons break)
#   -qtscrobbler (have no idea how I installed it)

# Software
sudo pacman -S --noconfirm gvim >> setup.log
sudo pacman -S --noconfirm git >> setup.log
sudo pacman -S --noconfirm mesa >> setup.log
sudo pacman -S --noconfirm chromium >> setup.log
sudo pacman -S --noconfirm i3-gaps >> setup.log
sudo pacman -S --noconfirm i3lock >> setup.log
sudo pacman -S --noconfirm i3blocks >> setup.log
sudo pacman -S --noconfirm rofi >> setup.log
sudo pacman -S --noconfirm arandr >> setup.log
sudo pacman -S --noconfirm feh >> setup.log
sudo pacman -S --noconfirm redshift >> setup.log
sudo pacman -S --noconfirm lxappearance >> setup.log
sudo pacman -S --noconfirm arc-gtk-theme >> setup.log
sudo pacman -S --noconfirm arc-icon-theme >> setup.log
sudo pacman -S --noconfirm compton >> setup.log
sudo pacman -S --noconfirm gnome-terminal >> setup.log
sudo pacman -S --noconfirm gramps >> setup.log
sudo pacman -S --noconfirm ranger >> setup.log
sudo pacman -S --noconfirm fzf >> setup.log
sudo pacman -S --noconfirm ncmpcpp >> setup.log
sudo pacman -S --noconfirm mpd >> setup.log
sudo pacman -S --noconfirm thunar >> setup.log
sudo pacman -S --noconfirm clang >> setup.log
sudo pacman -S --noconfirm cmake >> setup.log
sudo pacman -S --noconfirm conky >> setup.log

# Enable moving dotfiles
shopt -s dotglob

# Get my stuff from github
git clone https://stefan-ptrvch:madaFaka8@github.com/stefan-ptrvch/dotfiles.git

# Copy all stuff into place
cp -r ./dotfiles/* ./

# Remove dotfiles folder
rm -rf dotfiles

# Get vundle (on vm, got clones into /root)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# One Dark for gnome-terminal
wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && . one-dark.sh
