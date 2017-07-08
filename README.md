# Central.vim 🌷 

Create directories to store unique swap, backup, and undo files in a
centralized place.

Swap, backup, and undo are created in `~/.vim` 

```sh
.vim
├── backup
├── swap
└── undo
```

Vim is then set to use these locations.
```vim
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//
```

## Installation 

### [vim-plug](https://github.com/junegunn/vim-plug)
Add this to your `.vimrc`
```
Plug `her/central.vim`
```
Install with `:PlugInstall`

