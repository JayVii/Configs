" set height of command-bar
set cmdheight=1

" no color for 80th column
set colorcolumn=0

" error-notifications
set noerrorbells
set visualbell

" Colorschemes

"" Alduin
"let g:alduin_Shout_Dragon_Aspect = 0
"let g:alduin_Shout_Become_Ethereal = 1
"let g:alduin_Shout_Fire_Breath = 0

"" Gruvbox
"set background=dark
"colorscheme gruvbox
"let g:gruvbox_contrast_dark="medium"
" color-fix for spelling mistakes
"hi SpellBad guifg=Red ctermfg=Red

"" Dracula
set background=dark
colorscheme dracula

"" Mustang
"colorscheme mustang

"" Jay
"colorscheme jay
"set background=dark

"" Solarized
"set background=light
"colorscheme solarized

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Statusline

"" Vim-Airline
"let g:airline_detect_modified=0
"let g:airline_detect_paste=0
"let g:airline_detect_spell=0
"let g:airline_theme='zenburn'
"let g:airline_powerline_fonts=0

"" Custom
set statusline=                 " reset / empty
set statusline+=%1*             " color: transparent
set statusline+=%y              " flag: file-type
set statusline+=%m              " flag: modified
set statusline+=%r              " flag: read-only
set statusline+=[%{&spelllang}] " flag: spell-lang
set statusline+=%=              " seperator
set statusline+=L:\ %l/%L       " flag: line/lines
set statusline+=\ C:\ %c        " flag: column:
set showmode
