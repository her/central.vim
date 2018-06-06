# Central.vim 🌷 

**Centralize Backup, Swap, Undo**

Create and manage directories to store unique backup, swap, and undo
files in a centralized place.

Backup, swap, and undo are created in `$VIMHOME` (which defaults to
`~/.vim` on Unix based systems).

```sh
$VIMHOME
├── backup
├── swap
└── undo
```

Vim is then set to use these locations.
```vim
set backupdir=$VIMHOME/backup//
set directory=$VIMHOME/swap//
set undodir=$VIMHOME/undo//
set backup swapfile undofile
```

Vim will also manage these directories by deleting any files older
than `g:central_cleanup_enable` days (which defaults to 30 days).
This can be set to any duration in days, or set to zero to disable
auto deletion.
```vim
let g:central_cleanup_enable = 30
```

## Installation 

### [vim-plug](https://github.com/junegunn/vim-plug)
Add this to your `.vimrc`
```
Plug `her/central.vim`
```
Install with `:PlugInstall`

