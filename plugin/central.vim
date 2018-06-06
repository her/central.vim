" central.vim - Centralize Swap, Backup, Undo
" Author: Melanie Berkley <http://berkley.io>
" Version: 0.2.0
" License: BSD

set backupdir=$VIMHOME/backup//
set directory=$VIMHOME/swap//
set undodir=$VIMHOME/undo//

for dir in [ &backupdir, &directory, &undodir ]
    if !isdirectory(dir)
        call mkdir(dir, 'p')
    endif
endfor
