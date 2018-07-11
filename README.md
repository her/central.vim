# Central.vim 🌷 

**Centralize Backup, Swap, Undo**

Create and manage directories to store unique backup, swap, and undo
files in a centralized place.

Backup, swap, and undo are created in `$VIMHOME`, which defaults to
`$HOME/.vim` on Unix based systems and `$HOME\vimfiles` on Windows
based systems. This location can be manually overridden by defining
`$VIMHOME` with your local vimrc file.

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

Vim will also maintain multiple backups each time a file is written
to. These backup files are saved in `$VIMHOME/backup` and follow the
naming convention `<buffer name>~<original path>~<time stamp>`, thus
ensuing a unique backup each time the buffer is saved. This can be
disabled by setting `g:central_multiple_backup_enable` to zero, where
Vim will only maintain a single backup each time a file is written to.
```vim
let g:central_multiple_backup_enable = 0
```

## Installation

### [vim-plug](https://github.com/junegunn/vim-plug)
Add this to your `.vimrc`
```
Plug `her/central.vim`
```
Install with `:PlugInstall`

