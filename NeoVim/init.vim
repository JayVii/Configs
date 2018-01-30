""""""""""""""" NEOVIM CONFIG """""""""""""""
"
" Maintainer:
" JayVii
" jayvii@posteo.de
" https://jayvii.de
" https://github.com/JayVii
"
" Requirements:
" vim or neovim
" vim-plug (https://github.com/junegunn/vim-plug)
" powerline (https://github.com/powerline/fonts)
"
" Sections:
" 1. General
" 2. Colours & Interface
" 3. Autocompletion
" 4. Folding
" 5. Plugins
" 6. Custom Commands
" 7. Custom Keybinds
"
"""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""
" 1. General
"""""""""""""""""""""""""

" indent-steps
set sw=2

" filetype extensions
filetype plugin on
filetype indent off

" enable autoread when endited from outside
set autoread

" enable syntax highlighting
syntax on

" disable line-wrap
set nowrap

" enable line-enumberation
set number

" encoding
set encoding=utf8

" set filetype preference-order
set ffs=unix,dos,mac

" Spell-check
set nospell
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=de
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=de
autocmd BufRead,BufNewFile *.html setlocal spell spelllang=en
autocmd BufRead,BufNewFile *.R setlocal spell spelllang=en
syntax spell toplevel "spell-bug workaround 

" Auto-complete
set complete+=kspell

" ignore case when searching
set ignorecase

" highlight search results
set hlsearch

" show matching brackets
set showmatch

" Persistent undo
try
    set undodir=~/.nvim.undo
    set undofile
catch
endtry

" set working directory to current file
autocmd BufEnter * silent! lcd %:p:h

" use system-clipboard for yanked characters
set clipboard=unnamedplus

"""""""""""""""""""""""""
" 2. Colours & Interface
"""""""""""""""""""""""""

" vim colour-scheme
"colorscheme darkblue
set background=dark

" Transparent background
"hi Normal guibg=NONE ctermbg=NONE

" set height of command-bar
set cmdheight=1

" set column limit
set colorcolumn=80

" error-notifications
set noerrorbells
set visualbell

" set fonts
set gfn=DejaVu\ Sans\ 14,DejaVu\ Sans\ Mono\ 12

"""""""""""""""""""""""""
" 3. Autocompletion
"""""""""""""""""""""""""
" Autoindentation
set autoindent
set cindent

" Autoclose brackets
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>O
"inoremap ((     (
"inoremap ()     ()
"inoremap [      []<Left>
"inoremap [<CR>  [<CR>]<Esc>O
"inoremap [[     [
"inoremap []     []

" Autoclose quotation
"inoremap '      ''<Left>
"inoremap '<CR>  '<CR>'<Esc>O
"inoremap ''     '
"inoremap "      ""<Left>
"inoremap "<CR>  "<CR>"<Esc>O
"inoremap ""     "

"""""""""""""""""""""""""
" 4. Folding
"""""""""""""""""""""""""

" Folding based on markers ("za" to unfold)
set foldmethod=marker
setlocal foldmarker={{{,}}}

"""""""""""""""""""""""""
" 5. Plugins
"""""""""""""""""""""""""

" load plugins, update via :PlugUpdate
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
"Plug 'https://github.com/greyblake/vim-preview'
"Plug 'https://github.com/jceb/vim-orgmode'
"Plug 'https://github.com/motemen/git-vim'
Plug 'https://github.com/jalvesaq/Nvim-R'
Plug 'https://github.com/jamessan/vim-gnupg'
Plug 'https://github.com/coldfix/hexHighlight'
Plug 'https://github.com/lilydjwg/colorizer'
Plug 'https://github.com/Valloric/YouCompleteMe'
"Plug 'https://github.com/itchyny/calendar.vim' " Does no .ics import
"Plug 'https://github.com/mattn/calendar-vim'
  " Colorschemes
"Plug 'https://github.com/croaker/mustang-vim'
"Plug 'https://github.com/AlessandroYorba/Alduin'
"Plug 'https://github.com/AlessandroYorba/Despacio'
"Plug 'https://github.com/AlessandroYorba/Sierra'
"Plug 'https://github.com/AlessandroYorba/Arcadia'
"Plug 'https://github.com/trevordmiller/nova-vim'
"Plug 'https://github.com/josuegaleas/jay'
Plug 'https://github.com/dracula/vim'
call plug#end()

" Colorschemes
"" Alduin
"let g:alduin_Shout_Dragon_Aspect = 0
"let g:alduin_Shout_Become_Ethereal = 1
"let g:alduin_Shout_Fire_Breath = 0
"" Dracula
colorscheme dracula
"" Mustang
"colorscheme mustang
"" Jay
"colorscheme jay
set background=dark

" Nvim-R
autocmd BufRead,BufNewFile *.R call StartR("R")
"autocmd BufRead,BufNewFile *.R call RObjBrowser()
autocmd BufRead,BufNewFile *.R nnoremap <silent> <C-M> :call SendLineToR("down")<CR>
let R_objbr_place = "script,right" " Objectbrowser on the upper-right [script/console;left/right]
let R_objbr_opendf = 0 " Show data.frames
let R_objbr_openlist = 0 " Show lists
let R_objbr_allnames = 0 " Show hidden
let R_hi_fun = 1 " Syntax highlighting
let Rout_more_colors = 1 " Syntaxhighlighting in console
let rout_follow_colorscheme = 1 " use current cholorscheme
" TMux integration
let R_in_buffer = 0 " run R in neovim-buffer
let R_tmux_split = 1 " use tmux to split the editor and R
let R_show_args = 0 " help-window in autocomplete
let R_args_in_stline = 1 " argument completetion in statusline

" Vim-Airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline_theme='jay'
let g:airline_powerline_fonts=1

"""""""""""""""""""""""""
" 6. Custom Commands
"""""""""""""""""""""""""

" Footnotes (in Mails)
function! Footnote()
  execute "normal ma"
  let footNoteText = input("enter text for footnote: ")
  if exists("b:vimfootnotenumber")
    let b:vimfootnotenumber = b:vimfootnotenumber + 1
    let cr = ""
  else
    let b:vimfootnotenumber = 1
    let cr = "\<CR>"
  endif
  let b:pos = line('.').' | normal! '.virtcol('.').'|'.'4l'
  exe "normal a[".b:vimfootnotenumber."]\<Esc>G"
  if search("-- $", "b")
    exe "normal O".cr."[".b:vimfootnotenumber."] " . footNoteText
  else
    exe "normal o".cr."[".b:vimfootnotenumber."] " . footNoteText
  endif
  execute "normal `a"
endfunction
command FN :call Footnote()
" Compile LaTeX
function CompileLatex()
  ! latexmk -bibtex -pdf "%"
endfunction
command CL :call CompileLatex()

" Convert Markdown to PDF
function ConvertMarkdown()
  ! /usr/bin/pandoc -V "geometry:margin=1in" -s "%" -o "%:r.pdf"
endfunction
command MDpdf :call ConvertMarkdown()

" View PDF
function ViewPDF()
  ! /usr/bin/mupdf -A 8 "%:r.pdf" &
endfunction
command Vpdf :call ViewPDF()

" Spellcheck DE
command SCde :setlocal spell spelllang=de

" Spellcheck EN
command SCen :setlocal spell spelllang=en_gb

" Spellcheck off
command SCoff :setlocal nospell

" Fix Spellchecker
command SCfix :syntax spell toplevel

"Count Words and characters
command Count :w !wc -m -w

" switch top/bottom or left/right split
command Rotate :wincmd r

"""""""""""""""""""""""""
" 7. Custom keybinds
"""""""""""""""""""""""""
" switch between tiled buffers (ctrl + arrowkeys)
"nmap <silent> <C-Up> :wincmd k<CR>
"nmap <silent> <C-Down> :wincmd j<CR>
nnoremap <silent> <S-Left> :wincmd h<CR>
nnoremap <silent> <S-Right> :wincmd l<CR>

imap <silent> <C-e> <ESC><S-a>
nnoremap <silent> <C-e> <S-a><ESC>
vmap <silent> <C-e> $
imap <silent> <C-a> <Left><ESC><S-i>
nnoremap <silent> <C-a> <S-i><ESC>
vmap <silent> <C-a> 0

nnoremap <silent> <C-s> /
nnoremap <silent> <C-r> ?

" switch between tabs (alt + arrowkeys)
"nnoremap <A-Left> :tabprevious<CR>
"nnoremap <A-Right> :tabnext<CR>
" switch top/bottom or left/right split (alt + up)
"nnoremap <A-Up> :wincmd r<CR>
"let maplocalleader = ','


