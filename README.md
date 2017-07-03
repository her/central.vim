# Central.vim 🌷 

This plugin creates directories to store swap, backup, and undo files in a
centralized place. First it checks if the directories exist, if not it creates
three new directors, swap, backup, and undo inside ~/.vim 

## Installation 

### [vim-plug](https://github.com/junegunn/vim-plug)
Add this to your `.vimrc`
```
	Plug `her/central.vim`
```
Install with `:PlugInstall`

## Usage

In order for Vim to take advantage of these new directories we need to set their
location in .vimrc
```vim
	set undodir=~/.vim/undo//
	set directory=~/.vim/swap//
	set backupdir=~/.vim/backup//
```
The trailing double slash // enables functionality that ensures each file added to the directories will be unique, thereby preventing overwrites.

