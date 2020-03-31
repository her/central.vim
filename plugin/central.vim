" central.vim - Centralize Swap, Backup, Undo
" Author: Melanie Berkley <http://berkley.io>
" Collaborator: Matthew Bright <https://github.com/matt1003/>
" Version: 0.2.1
" License: BSD

if !exists('$VIMHOME')
    if has('win32') || has ('win64')
        let $VIMHOME=$HOME.'/vimfiles'
    else
        let $VIMHOME=$HOME.'/.vim'
    endif
endif

set backupdir=$VIMHOME/backup//
set directory=$VIMHOME/swap//
set undodir=$VIMHOME/undo//

set backup swapfile undofile

if !exists('g:central_cleanup_enable')
    let g:central_cleanup_enable = 30 "days
endif

function! CheckDirectories(timer)
    for s:dir in [ &backupdir, &directory, &undodir ]
        if !isdirectory(s:dir)
            call mkdir(s:dir, 'p')
        endif
    endfor

    if g:central_cleanup_enable > 0
        let s:epoch = localtime() - (g:central_cleanup_enable * 86400)
        for s:dir in [ &backupdir, &directory, &undodir ]
            for s:file in split(glob(substitute(s:dir, '//', '/*', '')))
                if getftime(s:file) < s:epoch
                    if filewritable(s:file)
                        call delete(s:file)
                    endif
                endif
            endfor
        endfor
    endif
endfunction

if has('timers')
    call timer_start(0, 'CheckDirectories')
else
    call CheckDirectories(1)
endif

if !exists('g:central_multiple_backup_enable')
    let g:central_multiple_backup_enable = 1
endif

if g:central_multiple_backup_enable == 1
    augroup CentralMultipleBackup
        autocmd!
        autocmd BufWritePre *
        \   let s:path = substitute(expand('%:p:h'),'/','%','g')
        \ | let s:time = strftime("%Y-%m-%d~%H:%M:%S")
        \ | let &backupext = '~'.s:path.'~'.s:time
    augroup END
endif
