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

set backup swapfile undofile

if !exists('g:central_cleanup_enable')
    let g:central_cleanup_enable = 30 "days
endif

if g:central_cleanup_enable > 0
    let epoch = localtime() - (g:central_cleanup_enable * 86400)
    for dir in [ &backupdir, &directory, &undodir ]
        for file in split(glob(substitute(dir, '//', '/*', '')))
            if getftime(file) < epoch
                call delete(file)
            endif
        endfor
    endfor
endif

if !exists('g:central_multiple_backup_enable')
    let g:central_multiple_backup_enable = 1
endif

if g:central_multiple_backup_enable == 1
    augroup CentralMultipleBackup
        autocmd!
        autocmd BufWritePre *
        \   let path = substitute(expand('%:p:h'),'/','%','g')
        \ | let time = strftime("%Y-%m-%d~%H:%M:%S")
        \ | let &backupext = '~'.path.'~'.time
    augroup END
endif
