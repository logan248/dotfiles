set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set mouse=a                             " Enable your mouse
set conceallevel=0                      " So that I can see `` in markdown files
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set mmp=1300
" set autochdir                           " Your working directory will always be the same as your working directory
" set foldcolumn=2                        " Folding abilities

" Additional by logan248
" Temporary files
set nobackup                            " This is recommended by coc
set noswapfile                          " Dont create swapfiles
set nowritebackup                       " This is recommended by coc

" File format
set fileformats=unix,dos,mac
set encoding=utf-8                      " The encoding displayed
filetype plugin indent on               " Automatically detect file types.

" Searching
set incsearch                           " Increamental search
set hlsearch                            " Highlight seaches
set wrapscan
set ignorecase                          " Case-Insensitive search...
set smartcase                           " ...unless search contains upper case letter
set nolazyredraw                        " don't redraw while executing macros
set tags=tags;                          " Find tags recursively
set path=+**                            " Search down into subfolders

" Make searching smart
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

" Indentation
set shiftround                          " Always indent by multiple of shiftwidth
set expandtab                           " Always use spaces instead of tabs
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set softtabstop=2                       " Columns a tab inserts in insert mode
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

" Wrapping
set nowrap                              " Display long lines as just one line
set textwidth=0                         " Turn off physical line wrapping
set wrapmargin=0                        " Turn off physical line wrapping
set whichwrap+=<,>,[,]

" Joining
set nojoinspaces                        " Only one space when joining lines
set formatoptions+=j                    " Remove comment leader when joining lines

" Splitting
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

" Scroll
set sidescrolloff=3                     " Keep at least 3 lines left/right
set scrolloff=3                         " Keep at least 3 lines above/below

" Disable bell
set novisualbell                        " Disable visual bell
set noerrorbells                        " Disable error bell

" UI
set cursorline                          " Enable highlighting of the current line
set showmatch
set number                              " Line numbers
"set relativenumber
"set fillchars+=vert:\                   " remove ugly vertical lines on window division
set nocursorcolumn                      " Disable cursor column
set matchtime=2
set termguicolors                       " Enable true colors support
set guifont=Hack\ Nerd\ Font
set background=dark                     " tell vim what the background color looks like
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set pumheight=10                        " Makes popup menu smaller
set ruler              			            " Show the cursor position all the time
set t_Co=256                            " Support 256 colors

" Folding
"set foldcolumn=1
"set foldlevel=20
"set foldlevelstart=7
"set foldmethod=syntax
"set foldignore=""
set nofoldenable                        " Disable folding

"Make completion menu behave like an IDE
set completeopt=noinsert,menuone,noselect

" Close show_docstring (deoplete)
set completeopt-=preview


" Disable modelines as a security precaution
set modelines=0
set nomodeline

" History
set history=1000                        " Remember more commands
"if has('persistent_undo')
"    set undofile                        " Persistent undo
"    set undodir=~/.config/nvim/temp/undo " Location to store undo history
"    set undolevels=1000                 " Max number of changes
"    set undoreload=10000                " Max lines to save for undo on a buffer reload
"endif

" Status lines
set laststatus=2                        " Always display the status line
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set cmdheight=2                         " More space for displaying messages

" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" You can't stop me
cmap w!! w !sudo tee %
