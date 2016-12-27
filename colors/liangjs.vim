" Vim color file - liangjs
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "liangjs"

hi IncSearch ctermfg=186 ctermbg=240 cterm=NONE
hi WildMenu ctermfg=81 ctermbg=NONE cterm=NONE
hi SignColumn ctermfg=112 ctermbg=235 cterm=NONE
hi SpecialComment ctermfg=240 ctermbg=NONE cterm=bold
hi Typedef ctermfg=81 ctermbg=NONE cterm=NONE
hi Title ctermfg=209 ctermbg=NONE cterm=NONE
hi Folded ctermfg=240 ctermbg=NONE cterm=NONE
hi PreCondit ctermfg=112 ctermbg=NONE cterm=bold
hi Include ctermfg=116 ctermbg=NONE cterm=NONE
"hi TabLineSel -- no settings --
hi StatusLineNC ctermfg=8 ctermbg=232 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText ctermfg=250 ctermbg=0 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText gui=bold,italic ctermfg=NONE ctermbg=239 cterm=bold
hi ErrorMsg ctermfg=197 ctermbg=235 cterm=bold
hi Ignore ctermfg=8 ctermbg=235 cterm=NONE
hi Debug ctermfg=138 ctermbg=NONE cterm=bold
hi PMenuSbar ctermfg=NONE ctermbg=232 cterm=NONE
hi Identifier ctermfg=208 ctermbg=NONE cterm=NONE
hi SpecialChar ctermfg=197 ctermbg=NONE cterm=bold
hi Conditional ctermfg=83 ctermbg=NONE cterm=bold
hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
hi Todo ctermfg=15 ctermbg=235 cterm=bold
hi Special ctermfg=81 ctermbg=235 cterm=NONE
hi LineNr ctermfg=250 ctermbg=234 cterm=NONE
hi StatusLine ctermfg=240 ctermbg=230 cterm=NONE
hi Normal ctermfg=15 ctermbg=0 cterm=NONE
hi Label ctermfg=185 ctermbg=NONE cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel ctermfg=NONE ctermbg=8 cterm=NONE
hi Search ctermfg=15 ctermbg=240 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter ctermfg=240 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment ctermfg=240 ctermbg=NONE cterm=NONE
hi Character ctermfg=135 ctermbg=NONE cterm=NONE
hi Operator ctermfg=248 ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE
"hi Union -- no settings --
"hi TabLineFill -- no settings --
hi Question ctermfg=81 ctermbg=NONE cterm=NONE
hi WarningMsg ctermfg=15 ctermbg=236 cterm=bold
hi VisualNOS ctermfg=NONE ctermbg=238 cterm=NONE
hi DiffDelete ctermfg=89 ctermbg=53 cterm=NONE
hi ModeMsg ctermfg=185 ctermbg=NONE cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi Define ctermfg=81 ctermbg=NONE cterm=NONE
hi FoldColumn ctermfg=240 ctermbg=NONE cterm=NONE
hi PreProc ctermfg=112 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual ctermfg=NONE ctermbg=237 cterm=NONE
hi MoreMsg ctermfg=185 ctermbg=NONE cterm=NONE
hi SpellCap ctermfg=NONE ctermbg=100 cterm=NONE
hi VertSplit ctermfg=8 ctermbg=232 cterm=bold
hi Exception ctermfg=112 ctermbg=NONE cterm=bold
hi Keyword ctermfg=197 ctermbg=NONE cterm=bold
hi Type ctermfg=81 ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=245 ctermbg=239 cterm=NONE
hi Cursor ctermfg=NONE ctermbg=230 cterm=NONE
"hi SpellLocal -- no settings --
hi Error ctermfg=9 ctermbg=53 cterm=NONE
hi PMenu ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=81 ctermbg=NONE cterm=NONE
hi Constant ctermfg=141 ctermbg=NONE cterm=bold
"hi DefinedName -- no settings --
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE
hi String ctermfg=134 ctermbg=NONE cterm=NONE
hi PMenuThumb ctermfg=81 ctermbg=NONE cterm=NONE
hi MatchParen ctermfg=0 ctermbg=250 cterm=bold
"hi LocalVariable -- no settings --
hi Repeat ctermfg=83 ctermbg=NONE cterm=bold
hi SpellBad ctermfg=NONE ctermbg=88 cterm=NONE
"hi CTagsClass -- no settings --
hi Directory ctermfg=112 ctermbg=NONE cterm=bold
hi Structure ctermfg=81 ctermbg=NONE cterm=NONE
hi Macro ctermfg=113 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=8 ctermbg=NONE cterm=underline
hi DiffAdd ctermfg=NONE ctermbg=23 cterm=NONE
"hi TabLine -- no settings --
hi cursorim ctermfg=234 ctermbg=227 cterm=NONE
"hi clear -- no settings --
hi mbenormal ctermfg=187 ctermbg=237 cterm=NONE
hi perlspecialstring ctermfg=185 ctermbg=NONE cterm=NONE
hi doxygenspecial ctermfg=222 ctermbg=NONE cterm=NONE
hi mbechanged ctermfg=255 ctermbg=237 cterm=NONE
hi mbevisiblechanged ctermfg=255 ctermbg=60 cterm=NONE
hi doxygenparam ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygensmallspecial ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygenprev ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch ctermfg=185 ctermbg=NONE cterm=NONE
hi cformat ctermfg=180 ctermbg=NONE cterm=NONE
hi lcursor ctermfg=NONE ctermbg=180 cterm=NONE
hi doxygenspecialmultilinedesc ctermfg=130 ctermbg=NONE cterm=NONE
hi taglisttagname ctermfg=105 ctermbg=NONE cterm=NONE
hi doxygenbrief ctermfg=215 ctermbg=NONE cterm=NONE
hi mbevisiblenormal ctermfg=252 ctermbg=60 cterm=NONE
hi user2 ctermfg=103 ctermbg=60 cterm=NONE
hi user1 ctermfg=48 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc ctermfg=130 ctermbg=NONE cterm=NONE
hi doxygencomment ctermfg=130 ctermbg=NONE cterm=NONE
hi cspecialcharacter ctermfg=181 ctermbg=NONE cterm=NONE
hi underline ctermfg=147 ctermbg=NONE cterm=NONE
hi titled ctermfg=15 ctermbg=52 cterm=NONE
"hi condtional ctermfg=123 ctermbg=NONE cterm=NONE
hi scrollbar ctermfg=39 ctermbg=17 cterm=NONE
hi htmlitalic ctermfg=252 ctermbg=234 cterm=NONE
hi htmlboldunderlineitalic ctermfg=252 ctermbg=234 cterm=NONE
hi htmlbolditalic ctermfg=252 ctermbg=234 cterm=NONE
hi htmlunderlineitalic ctermfg=252 ctermbg=234 cterm=NONE
hi htmlbold ctermfg=252 ctermbg=234 cterm=NONE
hi htmlboldunderline ctermfg=252 ctermbg=234 cterm=NONE
hi htmlunderline ctermfg=252 ctermbg=234 cterm=NONE
hi htmllink ctermfg=21 ctermbg=NONE cterm=NONE
hi sql_tatement ctermfg=92 ctermbg=NONE cterm=NONE
hi cics_statement ctermfg=64 ctermbg=NONE cterm=NONE
hi namespace ctermfg=22 ctermbg=NONE cterm=NONE
hi builtin ctermfg=33 ctermbg=NONE cterm=NONE
hi tablinefillsel ctermfg=21 ctermbg=NONE cterm=NONE
hi char ctermfg=105 ctermbg=234 cterm=NONE
hi foldecolumn ctermfg=239 ctermbg=234 cterm=NONE
hi special ctermfg=179 ctermbg=NONE cterm=NONE
hi statement ctermfg=208 ctermbg=NONE cterm=bold
hi cppstltype ctermfg=110 ctermbg=NONE cterm=NONE
hi identifier ctermfg=110 ctermbg=NONE cterm=NONE
hi function ctermfg=198 ctermbg=NONE cterm=bold
hi cursor ctermfg=15 ctermbg=167 cterm=NONE
hi vimfold ctermfg=15 ctermbg=NONE cterm=NONE
"hi htmltag -- no settings --
hi underlined ctermfg=139 ctermbg=NONE cterm=NONE
hi Float ctermfg=227 ctermbg=NONE cterm=NONE
hi Boolean ctermfg=227 ctermbg=NONE cterm=NONE
hi number ctermfg=227 ctermbg=NONE cterm=NONE
hi htmlh2 ctermfg=15 ctermbg=52 cterm=NONE
hi kde ctermfg=201 ctermbg=NONE cterm=NONE
hi spelllocale ctermfg=NONE ctermbg=11 cterm=NONE
hi myspecialsymbols ctermfg=201 ctermbg=NONE cterm=NONE
"hi default -- no settings --
hi class ctermfg=31 ctermbg=NONE cterm=NONE
