" Vim color file
" Maintainer:	Parhum Farzad
" Last Change:	$Date: 2017/03/16 19:30:30 $
" Last Change:	$Date: 2017/03/16 19:30:30 $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="pdesert"

hi Normal	guifg=#A9A9A9 guibg=black

" highlight groups
"hi Cursor	guibg=khaki guifg=slategrey
hi Cursor       guifg=#000000 guibg=#EEEEEC ctermfg=0 ctermbg=15
hi CursorLine   guibg=#000000
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2c2c2 guifg=black gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
hi LineNr	guifg=#C4A000
hi ModeMsg	guifg=#A15700
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=#2A4D6C guibg=black
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=ForestGreen
hi StatusLine	guibg=#EEEEEC guifg=black gui=none
hi StatusLineNC	guibg=#AAAAAA guifg=black gui=none
hi Title	guifg=#75507B
"hi Visual	gui=none guifg=khaki guibg=olivedrab
"hi Visual	term=reverse cterm=reverse guibg=olivedrab
hi Visual	gui=none guifg=white guibg=#147aba
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
"hi Comment	guifg=SkyBlue
hi Comment	guifg=#06989A
hi Constant	guifg=#AA5C00
hi Identifier	guifg=#34E2E2
hi Statement	guifg=#C4A000
hi PreProc	guifg=#75507B
hi Type		guifg=darkkhaki
hi Special	guifg=navajowhite
hi Underlined guifg=#75507B
hi Ignore	guifg=grey40
"hi Error
hi Todo		guifg=black guibg=#FCE94F

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
hi Comment	ctermfg=darkcyan
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=6
hi Statement	ctermfg=3
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1


"vim: sw=4
