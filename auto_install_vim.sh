#!/bin/sh

VIMHOME=~/.vim

warn(){
    echo "$1" >&2
}

error(){
    warn "$1"
    exit 1
}

#check the vimrc
#check the .vim
#check the .vimrc
[ -e "$VIMHOME/vimrc" ] && error "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && error "~/.vim already exists."
[ -e "~/.vimrc" ] && error "~/.vimrc already exists."


#git clone https://github.com/gopherlin/codeinit.git "$VIMHOME"
ln -s $VIMHOME/vimrc ~/.vimrc

echo "gopherlin's vimrc is installed"



