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

" copy to system clipboard
vmap <C-C> "+y

augroup terminal
  autocmd!
  " start in insert mode
  autocmd TermOpen * startinsert
  " don't show line number
  autocmd TermOpen * setlocal nonumber norelativenumber
  " don't show invisible chars
  autocmd TermOpen * setlocal nolist
augroup END

" exit terminal mode
tmap <Esc> <C-\><C-n>

" remember last file position
autocmd BufReadPost * ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

set cursorline      " highlight current line
colorscheme liangjs

set autowrite       " auto save

runtime compile.vim
imap <F9> <ESC>:call Compile()<CR>
nmap <F9> :call Compile()<CR>

runtime runprog.vim
imap <F5> <ESC>:call Runprog()<CR>
nmap <F5> :call Runprog()<CR>
