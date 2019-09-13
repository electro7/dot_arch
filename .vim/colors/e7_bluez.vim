" File:       e7_bluez.vim
" Maintainer: Electro7
" Modified:   08 sep 2019
" License:    MIT

" Colorscheme hacking:"{{{
" ----------------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" }}}
" Initialisation:"{{{
"  ---------------------------------------------------------------------------
if !has("gui_running") && &t_Co < 256
  finish
endif

if !exists("g:use_Xresources")
  let g:use_Xresources = 0
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "e7_bluez"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------
if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#213145"
  let s:foreground = "#cbd7E6"
  let s:selection  = "#3A5678"
  let s:line       = "#293e56"
  let s:comment    = "#607c9f"
  let s:red        = "#ee4f84"
  let s:orange     = "#f1cb5d"
  let s:yellow     = "#edf68e"
  let s:green      = "#a1edf3"
  let s:aqua       = "#87dfeb"
  let s:blue       = "#92b6f4"
  let s:purple     = "#c1a6f2"
  let s:window     = "#5a708c"
  let s:darkcolumn = "#28323e"
  let s:addbg      = "#293e56"
  let s:addfg      = "NONE"
  let s:changebg   = "#293E56"
  let s:changefg   = "NONE"
  let s:darkblue   = "#4583ed"
  let s:darkcyan   = "#3bcbde"
  let s:darkred    = "#ed457d"
  let s:darkpurple = "#824de6"
  let s:darkgreen  = "#51e1ac"
else
  let s:vmode      = "cterm"
  let s:background = "0"
  let s:window     = "15"
  let s:darkcolumn = "NONE"
  let s:addbg      = "0"
  let s:addfg      = "NONE"
  let s:changebg   = "0"
  let s:changefg   = "NONE"

  " With X resources
  if g:use_Xresources == 1
    let s:foreground = "15"   " White
    let s:selection  = "8"    " DarkGrey
    let s:line       = "0"    " Black
    let s:comment    = "7"    " LightGrey
    let s:red        = "9"    " LightRed
    let s:orange     = "3"    " DarkYellow
    let s:yellow     = "11"   " LightYellow
    let s:green      = "10"   " LightGreen
    let s:aqua       = "14"   " LightCyan
    let s:blue       = "12"   " LightBlue
    let s:purple     = "13"   " LightMagenta
    let s:darkblue   = "4"    " DarkBlue
    let s:darkcyan   = "6"    " DarkCyan
    let s:darkred    = "1"    " DarkRed
    let s:darkpurple = "5"    " DarkPurple
    let s:darkgreen  = "2"    " DarkGreen
  " Default
  else
    let s:foreground = "250"
    let s:selection  = "237"
    let s:line       = "235"
    let s:comment    = "243"
    let s:red        = "167"
    let s:orange     = "173"
    let s:yellow     = "221"
    let s:green      = "143"
    let s:aqua       = "109"
    let s:blue       = "110"
    let s:purple     = "139"
    let s:darkblue   = "24"
    let s:darkcyan   = "69"
    let s:darkred    = "52"
    let s:darkpurple = "57"
    let s:darkgreen  = "28"
  endif
endif

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg=".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg=".s:selection ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg=".s:comment   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"
exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_blue       = ' ".s:vmode."bg=".s:blue      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_darkblue   = ' ".s:vmode."bg=".s:darkblue  ."'"
exe "let s:bg_darkcyan   = ' ".s:vmode."bg=".s:darkcyan  ."'"
exe "let s:bg_darkred    = ' ".s:vmode."bg=".s:darkred   ."'"
exe "let s:bg_darkpurple = ' ".s:vmode."bg=".s:darkpurple."'"
exe "let s:bg_darkgreen  = ' ".s:vmode."bg=".s:darkgreen ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:line      ."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg=".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg=".s:selection ."'"
exe "let s:fg_line       = ' ".s:vmode."fg=".s:line      ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg=".s:comment   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"
exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_blue       = ' ".s:vmode."fg=".s:blue      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_darkblue   = ' ".s:vmode."fg=".s:darkblue  ."'"
exe "let s:fg_darkcyan   = ' ".s:vmode."fg=".s:darkcyan  ."'"
exe "let s:fg_darkred    = ' ".s:vmode."fg=".s:darkred   ."'"
exe "let s:fg_darkpurple = ' ".s:vmode."fg=".s:darkpurple."'"
exe "let s:fg_darkgreen  = ' ".s:vmode."fg=".s:darkgreen ."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

if has("gui_running")
  exe "let s:sp_none       = ' guisp=".s:none      ."'"
  exe "let s:sp_foreground = ' guisp=".s:foreground."'"
  exe "let s:sp_background = ' guisp=".s:background."'"
  exe "let s:sp_selection  = ' guisp=".s:selection ."'"
  exe "let s:sp_line       = ' guisp=".s:line      ."'"
  exe "let s:sp_comment    = ' guisp=".s:comment   ."'"
  exe "let s:sp_red        = ' guisp=".s:red       ."'"
  exe "let s:sp_orange     = ' guisp=".s:orange    ."'"
  exe "let s:sp_yellow     = ' guisp=".s:yellow    ."'"
  exe "let s:sp_green      = ' guisp=".s:green     ."'"
  exe "let s:sp_aqua       = ' guisp=".s:aqua      ."'"
  exe "let s:sp_blue       = ' guisp=".s:blue      ."'"
  exe "let s:sp_purple     = ' guisp=".s:purple    ."'"
  exe "let s:sp_window     = ' guisp=".s:window    ."'"
  exe "let s:sp_addbg      = ' guisp=".s:addbg     ."'"
  exe "let s:sp_addfg      = ' guisp=".s:addfg     ."'"
  exe "let s:sp_changebg   = ' guisp=".s:changebg  ."'"
  exe "let s:sp_changefg   = ' guisp=".s:changefg  ."'"
  exe "let s:sp_darkblue   = ' guisp=".s:darkblue  ."'"
  exe "let s:sp_darkcyan   = ' guisp=".s:darkcyan  ."'"
  exe "let s:sp_darkred    = ' guisp=".s:darkred   ."'"
  exe "let s:sp_darkpurple = ' guisp=".s:darkpurple."'"
  exe "let s:sp_darkgreen  = ' guisp=".s:darkgreen ."'"
else
  let s:sp_none       = ""
  let s:sp_foreground = ""
  let s:sp_background = ""
  let s:sp_selection  = ""
  let s:sp_line       = ""
  let s:sp_comment    = ""
  let s:sp_red        = ""
  let s:sp_orange     = ""
  let s:sp_yellow     = ""
  let s:sp_green      = ""
  let s:sp_aqua       = ""
  let s:sp_blue       = ""
  let s:sp_purple     = ""
  let s:sp_window     = ""
  let s:sp_addbg      = ""
  let s:sp_addfg      = ""
  let s:sp_changebg   = ""
  let s:sp_changefg   = ""
  let s:sp_darkblue   = ""
  let s:sp_darkcyan   = ""
  let s:sp_darkred    = ""
  let s:sp_darkpurple = ""
endif

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
"
exe "hi! ColorColumn"   .s:fg_darkred     .s:bg_selection   .s:fmt_none
exe "hi! Conceal"       .s:fg_background  .s:bg_none        .s:fmt_none
"       Cursor"
exe "hi! Cursor"        .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! lCursor"       .s:fg_background  .s:bg_blue        .s:fmt_none
"       CursorIM"
exe "hi! CursorColumn"  .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_red         .s:fmt_none
exe "hi! DiffText"      .s:fg_red         .s:bg_addbg       .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_line        .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! FoldColumn"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"       Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_darkcolumn  .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ModeMsg"       .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"       PmenuSbar"
"       PmenuThumb"
exe "hi! Question"      .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_orange      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_darkcolumn  .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"       TabLineFill"
"       TabLineSel"
exe "hi! Title"         .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"       VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
"       WildMenu"

" Use Xresources for background colour
if has('gui_running') || (g:use_Xresources != 1)
  exe "hi! Normal"        .s:fg_foreground  .s:bg_background  .s:fmt_none
else
  exe "hi! Normal"        .s:fg_foreground  .s:bg_none        .s:fmt_none
endif

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_darkgreen   .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Character"       .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Number"          .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! Boolean"         .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! Float"           .s:fg_red         .s:bg_none        .s:fmt_none

exe "hi! Identifier"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Conditional"     .s:fg_blue        .s:bg_none        .s:fmt_none
"       Repeat"
"       Label"
exe "hi! Operator"        .s:fg_blue        .s:bg_none        .s:fmt_none
"       Keyword"
"       Exception"

exe "hi! PreProc"         .s:fg_darkcyan    .s:bg_none        .s:fmt_none
"       Include"
"       Define"
"       Macro"
"       PreCondit"

exe "hi! Type"            .s:fg_aqua        .s:bg_none        .s:fmt_none
"       StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"       Typedef"

exe "hi! Special"         .s:fg_orange      .s:bg_none        .s:fmt_none
"       SpecialChar"
"       Tag"
"       Delimiter"
"       SpecialComment"
"       Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_undr

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_none        .s:bg_darkred     .s:fmt_none

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" HTML and Markdown Syntax:"{{{
" ----------------------------------------------------------------------------

" HTML highlighting
exe "hi! htmlBold"        .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! htmlItalic"      .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! htmlEndTag"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! htmlTag"         .s:fg_purple      .s:bg_none        .s:fmt_none

" Markdown highlighting
exe "hi! markdownCode"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! markdownError"   .s:fg_red         .s:bg_none        .s:fmt_none

exe "hi! markdownCodeBlock"         .s:fg_selection .s:bg_none  .s:fmt_none
exe "hi! markdownHeadingDelimiter"  .s:fg_red       .s:bg_none  .s:fmt_none


"}}}
" Plugins:"{{{
" ----------------------------------------------------------------------------

" GitGutter
exe "hi! GitGutterAdd"          .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! GitGutterDelete"       .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_yellow      .s:bg_none        .s:fmt_none

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"       diffOldFile
"       diffNewFile
"       diffFile
"       diffOnly
"       diffIdentical
"       diffDiffer
"       diffBDiffer
"       diffIsA
"       diffNoEOL
"       diffCommon
hi! link diffRemoved Constant
"       diffChanged
hi! link diffAdded Special
"       diffLine
"       diffSubname
"       diffComment

"}}}
" vim:foldmethod=marker:foldlevel=0
