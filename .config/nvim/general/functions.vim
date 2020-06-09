" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Remove trailing whitespaces automatically before save
" augroup strip_ws
"   autocmd BufWritePre * call utils#stripTrailingWhitespaces()
" augroup END

if has("autocmd")

    augroup vimrcEx
      au!

      " For all text files set 'textwidth' to 78 characters.
      "autocmd FileType text setlocal textwidth=108

      " Trim whitespace onsave
      autocmd BufWritePre * %s/\s\+$//e

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      " Also don't do it when the mark is in the first line, that is the default
      " position when opening a file.
      autocmd BufReadPost *
                  \ if line("'\"") > 1 && line("'\"") <= line("$") |
                  \   exe "normal! g`\"" |
                  \ endif

  augroup END
endif " has("autocmd")
