# Central.vim 🌷 

**Centralize Backup, Swap, Undo

Create directories to store unique backup, swap, and undo files in a
centralized place.

Backup, swap, and undo are created in `~/.vim` 

```sh
.vim
├── backup
├── swap
└── undo
```

Vim is then set to use these locations.
```vim
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
```

## Installation 

### [vim-plug](https://github.com/junegunn/vim-plug)
Add this to your `.vimrc`
```
Plug `her/central.vim`
```
Install with `:PlugInstall`

