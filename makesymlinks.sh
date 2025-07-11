#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/git/GNUdotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="emacs emacs.d/custom.el emacs.d/org-cgr.el bashrc bash_aliases Rprofile gitconfig latexmkrc nbrc notarc bm-repository octaverc radian_profile tmux.conf lintr"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# lets add a few specific symlinks for non-dotfiles in ~/bin
bindir=~/git/GNUdotfiles/bin
binolddir=~/bin/bin_old
binfiles="bashmarks.sh displayreadme ipadsync markdown mterm rterm v t.py matlabcmd histmatch z.sh"

# create bin_old in ~/bin
echo "Creating $binolddir for backup of any existing bin files in ~/bin"
mkdir -p $binolddir
echo "...done"

# move any existing bin files in bin to bin_old directory, then create symlinks 
for file in $binfiles; do
    echo "Moving any existing binfiles from ~/bin to $binolddir"
    mv ~/bin/$file ~/bin/bin_old/
    echo "Creating symlink to $file in ~/bin directory."
    ln -s $bindir/$file ~/bin/$file
done
