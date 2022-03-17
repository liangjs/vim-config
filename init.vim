runtime plugins.vim

set number          " show line number

set mouse=a         " enable mouse usage (all modes)

set tabstop=2       " number of columns occupied by a tab
set softtabstop=2   " see multiple spaces as tabstops so <BS> does the right thing
set expandtab       " converts tabs to white space
set shiftwidth=2    " width for autoindents
set autoindent      " indent a new line the same amount as the line just typed
set smarttab        " <Tab> in front of a line inserts many blanks
set cindent         " automatic C program indenting

set linebreak       " don't break at words
let &showbreak='↪ ' " to be shown at start of wrapped lines
set list            " show invisible chars
"setlocal listchars=space:·,tab:→\ ,
set listchars=tab:\ \ ,trail:·,nbsp:␣,extends:›,precedes:‹

set fileencodings=ucs-bom,utf-8,gb2312,latin1

set ignorecase      " case insensitive search
set smartcase       " switch to case-sensitive search on capital letters

set splitbelow      " new window at bottom
set splitright      " new window on the right

" copy to system clipboard
vmap <C-c> "+y

augroup terminal
  autocmd!
  " start in insert mode
  autocmd TermOpen * startinsert
  " don't show line number
  autocmd TermOpen * setlocal nonumber norelativenumber
  " don't show invisible chars
  autocmd TermOpen * setlocal nolist
augroup END

nnoremap <C-t> :split term://$SHELL<CR>
imap <C-t> <ESC><C-t>

" exit terminal mode
tnoremap <Esc> <C-\><C-n>

" remember last file position
autocmd BufReadPost * ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

set cursorline      " highlight current line
colorscheme liangjs

set autowrite       " auto save

" build program
runtime compile.vim
nnoremap <F9> :call Compile()<CR>
imap <F9> <ESC><F9>

" run program
runtime runprog.vim
nnoremap <F5> :call Runprog()<CR>
imap <F5> <ESC><F5>

" key mapping for buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-d> :bd<CR>
nnoremap <Leader>b :ls<cr>:buffer<space>
imap <C-h> <ESC><C-h>
imap <C-l> <ESC><C-l>
imap <C-n> <ESC><C-n>
imap <C-d> <ESC><C-d>
