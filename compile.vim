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

let s:fs_level = 3

function s:detect_fs(names)
  for level in range(s:fs_level)
    for name in a:names
      if filereadable('./' . repeat("../", level) . name)
        return level
      endif
    endfor
  endfor
  return -1
endfunc

function s:detect_ft(names)
  if index(a:names, &filetype) != -1
    return 0
  else
    return -1
  endif
endfunc

let s:detectors = {
      \   "fs": function("s:detect_fs"),
      \   "ft": function("s:detect_ft"),
      \ }

function s:set_makeprg()
  for [key, detect] in items(s:detections)
    let Detector = s:detectors[detect[0]]
    let level = Detector(detect[1])
    if level >= 0
      return [level, s:commands[key]]
    endif
  endfor
  return [0, &makeprg]
endfunc

function Compile()
  let cwd = getcwd()
  let vals = s:set_makeprg()
  let level = vals[0]
  let &makeprg = vals[1]
  exec "cd ./" . repeat("../", level)
  exec "make"
  exec "cd " . cwd
endfunc
