" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1,
  \        'allow_italic': 1,
  \        'allow_bold': 0
  \     }
  \   }
  \ }

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme PaperColor

