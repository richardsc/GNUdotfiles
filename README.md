# dotfiles repository

This repo contains my dot and configuration files, tweaked for deployment on a GNU/Linux machine. The preferences here are originally based off of a similar configuration developed for an OSX environment, found at:

https://github.com/richardsc/dotfiles

The idea here is that I can keep such things consistent between multiple machines (office Desktop and laptop).

# Initial Deployment

The `makesymlinks.sh` script first backs up any dotfiles it finds in `~/` to `~/dotfiles_old` (creating the directory if necessary), and then creates symbolic links to the files in the git repo. The script is based on one that I found [here][1]

[1]: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

