let s:commands = {
      \   "sh": "bash \"%\"",
      \   "python": "python \"%\"",
      \   "lua": "lua \"%\"",
      \   "javascript": "node \"%\"",
      \ }

let s:default = "\"%:p:r\""

function s:get_command()
  for [key, cmd] in items(s:commands)
    if &filetype == key
      return cmd
    endif
  endfor
  return s:default
endfunc

function Runprog()
  exec "w"
  let cmd = s:get_command()
  exec "term " .. cmd
endfunc

function Debug()
  exec "term gdb \"%:p:r\""
endfunc
