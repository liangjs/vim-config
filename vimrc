if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=light
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set selection=exclusive
set selectmode=mouse,key
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set nu
set nocp
set ruler
set novisualbell
set autoread
set completeopt=preview,menu
set clipboard+=unnamed
set nobackup
set cursorline
set magic
set tabstop=4
set autoindent
"set scrolloff=50
set cindent
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set history=500
set noswapfile
set hlsearch
set incsearch
set backspace=2
set report=0
set whichwrap+=<,>,h,l
"set foldmethod=indent
set noerrorbells
set linebreak
set laststatus=2
set fo+=mB
if has("gui_running")
  set nowrap
  set guioptions+=b
endif

colorscheme liangjs

vmap <Tab> >
vmap <S-Tab> <
nmap <Home> :call SmartHome()<CR>
imap <Home> <c-r>=SmartHome2()<CR>

func! SmartHome()
  if col('.') == 1
    exec "normal! ^"
    return
  endif
  let line = getline('.')
  let end = 0
  while line[end] == "\<Space>" || line[end] == "\<Tab>"
    let end += 1
  endw
  if col('.') - 1 == end || end == col('$') - 1
    exec "normal! \<Home>"
  else
    exec "normal! ^"
  endif
endf

func! SmartHome2()
  let now = col('.')-1
  let line = getline('.')
  if now == 0
    exec "normal! ^"
    if line[col('.') - 1] == "\<Space>" || line[col('.') - 1] == "\Tab"
      return "\<Right>"
    else
      return ""
    endif
  endif
  let end = 0
  while line[end] == "\<Space>" || line[end] == "\<Tab>"
    let end += 1
  endw
  if now == end || end == col('$') - 1
    return "\<Home>"
  else
    exec "normal! ^"
    return ""
  endif
endf

func! InQuote(pos)
  let line = strpart(getline('.'), 0, a:pos-1)
  let n = len(line)
  let ct1 = "false"
  let ct2 = "false"
  let i = 0
  while i < n
    if line[i] == '\'
      let i += 2
      continue
    endif
    if line[i] == '"' && !ct1
      let ct2 = !ct2
    elseif line[i] == "'" && !ct2
      let ct1 = !ct1
    endif
    let i += 1
  endw
  return ct1 || ct2
endf

inoremap ( <c-r>=OpenPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair('(', ')')<CR>
inoremap [ <c-r>=OpenPair('[',']')<CR>
inoremap ] <c-r>=ClosePair('[',']')<CR>
inoremap { <c-r>=OpenPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('{', '}')<CR>
inoremap <BS> <c-r>=RemovePairs()<CR>
inoremap ' <c-r>=CompleteQuote("'")<CR>
inoremap " <c-r>=CompleteQuote('"')<CR>
inoremap <CR> <c-r>=Enter()<CR>

func! Match(open, close)
  let line = getline('.')
  let n = len(line)
  let ans = 0
  let ct1 = "false"
  let ct2 = "false"
  let i = 0
  while i < n
    if line[i] == '\'
      let i += 2
      continue
    endif
    if line[i] == '"' && !ct1
      let ct2 = !ct2
    elseif line[i] == "'" && !ct2
      let ct1 = !ct1
    elseif line[i] == a:open && !ct1 && !ct2
      let ans += 1
    elseif line[i] == a:close && !ct1 && !ct2
      let ans -= 1
      if ans < 0
        return 0
      endif
    endif
    let i += 1
  endw
  return ans == 0
endf

func! OpenPair(open, close)
  if InQuote(col('.'))
    return a:open
  endif
  if Match(a:open, a:close)
    return a:open . a:close . "\<Left>"
  else
    return a:open
  endif
endf

func! ClosePair(open, close)
  if InQuote(col('.'))
    return a:close
  endif
  if !Match(a:open, a:close)
    return a:close
  endif
  if getline('.')[col('.') - 1] == a:close
    return "\<Right>"
  else
    return a:close
  endif
endf

func! Enter()
  let now = col('.') - 1
  let line = getline('.')
  if line[now-1] == '{' && line[now] == '}'
    return "\<CR>\<Up>\<End>\<CR>"
  endif
  return "\<CR>"
endf

func! RemovePairs()
  let line = getline('.')
  let prev_char = line[col('.') - 2]
  let next_char = line[col('.') - 1]
  if InQuote(col('.') - 1)
    return "\<BS>"
  endif
  if prev_char == '(' && next_char == ')'
    if !Match('(', ')')
      return "\<BS>"
    else
      return "\<Del>\<BS>"
    endif
  elseif prev_char == '{' && next_char == '}'
    if !Match('{', '}')
      return "\<BS>"
    else
      return "\<Del>\<BS>"
    endif
  elseif prev_char == '[' && next_char == ']'
    if !Match('[', ']')
      return "\<BS>"
    else
      return "\<Del>\<BS>"
    endif
  elseif prev_char == '"' && next_char == '"'
    return "\<Del>\<BS>"
  elseif prev_char == "'" && next_char == "'"
    return "\<Del>\<BS>"
  endif
  return "\<BS>"
endf

func! CompleteQuote(quote)
  let next_char = getline('.')[col('.') - 1]
  if InQuote(col('.'))
    if next_char == a:quote
      return "\<Right>"
    else
      return a:quote
    endif
  endif
  return a:quote . a:quote . "\<Left>"
endf

imap <F9> <ESC>:call Compile()<CR>
imap <F5> <ESC>:call Runexec()<CR>
imap <F7> <ESC>:call Debug()<CR>
map <F9> :call Compile()<CR>
map <F5> :call Runexec()<CR>
map <F7> :call Debug()<CR>
imap <C-F> <ESC>:call Astyle()<CR>
map <C-F> :call Astyle()<CR>

let makefile = 0
func! Compile()
  exec "w"
  let cwd = getcwd()
  exec "cd %:p:h"
  if g:makefile
    exec "!make"
  elseif &filetype == "make"
    exec "!make -f \"%\""
  elseif &filetype == "java"
    exec "!javac \"%\" -g"
  elseif &filetype == "pascal"
    exec "!fpc % -g"
  elseif &filetype == "c"
    exec "!gcc % -o %< -g -lm -Wall -fdiagnostics-color=always"
  elseif &filetype == "cpp"
    exec "!g++ % -o %< -g -Wall -fdiagnostics-color=auto"
  elseif &filetype == "tex"
    "exec "!pdftexi2dvi \"%\""
    exec "!xelatex \"%\""
  endif
  exec "cd " . cwd
endf

func! Runexec()
  exec "w"
  let cwd = getcwd()
  exec "cd %:p:h"
  if &filetype == "sh"
    exec "!sh %"
  elseif &filetype == "java"
    exec "!java -classpath %:p:h %:r"
  elseif &filetype == "python"
    exec "!python %"
  elseif &filetype == "lua"
    exec "!lua %"
  elseif &filetype == "tex"
    exec "!xdg-open %<.pdf"
  else
    exec "!%:p:r"
  endif
  exec "cd " . cwd
endf

func! Debug()
  exec "w"
  let cwd = getcwd()
  exec "cd %:p:h"
  if &filetype == "python"
    exec "!python -m pdb %"
  else
    "exec "ConqueGdb %<"
    exec "!gdb %<"
  endif
  exec "cd " . cwd
endf

func! Astyle()
  exec "w"
  let tmp = "!astyle %"
  let tmp = tmp . " --style=ansi"
  let tmp = tmp . " --indent=spaces=4"
  "let tmp = tmp . " --indent-namespaces"
  let tmp = tmp . " --convert-tabs"
  let tmp = tmp . " --suffix=none"
  let tmp = tmp . " --pad-oper"
  let tmp = tmp . " --pad-header"
  let tmp = tmp . " --unpad-paren"
  let tmp = tmp . " --align-pointer=name"
  let tmp = tmp . " --align-reference=name"
"  let tmp = tmp . " --remove-brackets"
"  let tmp = tmp . " --max-code-length=80"
"  let tmp = tmp . " --break-after-logical"
  let tmp = tmp . " --keep-one-line-blocks"
  if has("macunix")
    let tmp = tmp . " --lineend=macold"
  elseif has("unix")
    let tmp = tmp . " --lineend=linux"
  else
    let tmp = tmp . " --lineend=windows"
  endif
  if &filetype == "c" || &filetype == "cpp"
    exec tmp . " --mode=c"
  elseif &filetype == "java"
    exec tmp . " --mode=java"
  elseif &filetype == "cs"
    exec tmp . " --mode=cs"
  endif
  exec "e"
endf

nmap <S-Up> :call PageMoveUp()<CR>
imap <S-Up> <Esc>:call PageMoveUp()<CR>i
nmap <PageUp> :call PageMoveUp()<CR>
imap <PageUp> <Esc>:call PageMoveUp()<CR>i
imap <tab> <c-r>=SmartTab()<cr>

func! PageMoveUp()
  let visline = line("w$") - line("w0") + 1
  if line('.') <= visline
    exec "normal! gg"
  else
    exec "normal! \<PageUp>"
  endif
endf

func! SmartTab()
  let line = getline('.')
  let now = col('.')-1
  if line('.') == 1
    return "\<Tab>"
  endif
  let length = len(line)
  let i = 0
  while i < length && (line[i] == "\<Space>" || line[i] == "\<Tab>")
    let i += 1
  endw
  if i < now
    return "\<Tab>"
  endif
  exec "normal! ^"
  let now2 = col('.')-1
  exec "normal! O \<Left>\<Del>"
  let new = col('.')-1
  exec "normal! dd"
  if new <= now2
    if i == length
      return "\<Right>\<Tab>"
    else
      return "\<Tab>" 
    endif
  endif
  let ans = ""
  let i = col('.')-1
  while i != now2
    if i < now2
      let ans = ans . "\<Right>"
      let i += 1
    else
      let ans = ans . "\<Left>"
      let i -= v
    endif
  endw
  let i = 0
  while i <= new - now2
    let i += 1
    let ans = ans . "\<Space>"
  endw
  return ans
endf
"language us

map <F12> :Tlist<cr>
autocmd BufWritePost * :TlistUpdate

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_crypt = 1
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.readonly = ''
let g:airline_theme="sol"

map <s-pagedown> :bn<cr>
map <s-pageup> :bp<cr>
map <s-w> :bd<cr>

"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif
