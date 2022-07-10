" remove banner
let g:netrw_banner = 0

" percentage of window size
let g:netrw_winsize = 25

" sync with the current directory
let g:netrw_keepdir = 0

" remove netrw buffer after opening files
autocmd FileType netrw setlocal bufhidden=wipe
set nohidden

"nnoremap <Leader>e :Explore<CR>
