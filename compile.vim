let s:commands = {
      \   "make": "make",
      \   "ninja": "ninja",
      \   "c": "gcc % -o %< -g -lm",
      \   "c++": "g++ % -o %< -g",
      \ }

let s:detections = {
      \   "make": ["fs", ["makefile", "Makefile", "GNUmakefile"]],
      \   "ninja": ["fs", ["build.ninja"]],
      \   "c": ["ft", ["c"]],
      \   "c++": ["ft", ["cpp", "cc", "cxx"]],
      \ }

function s:detect_fs(names)
  let cwd = getcwd()
  for name in a:names
    if filereadable(cwd . '/' . name)
      return 1
    endif
  endfor
  return 0
endfunc

function s:detect_ft(names)
  return index(a:names, &filetype) != -1
endfunc

let s:detectors = {
      \   "fs": function("s:detect_fs"),
      \   "ft": function("s:detect_ft"),
      \ }

function s:set_makeprg()
  for [key, detect] in items(s:detections)
    let Detector = s:detectors[detect[0]]
    if Detector(detect[1])
      return s:commands[key]
    endif
  endfor
  return &makeprg
endfunc

function Compile()
  let &makeprg = s:set_makeprg()
  exec "make"
endfunc
