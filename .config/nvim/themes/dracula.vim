" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme nord
