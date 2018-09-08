" switch between tiled buffers (ctrl + arrowkeys)
"nmap <silent> <C-Up> :wincmd k<CR>
"nmap <silent> <C-Down> :wincmd j<CR>
"nnoremap <silent> <C-Left> :wincmd h<CR>
"nnoremap <silent> <C-Right> :wincmd l<CR>

" Emacs-like binds
"" End of Line
imap <silent> <C-e> <ESC><S-a>
nnoremap <silent> <C-e> <S-a><ESC>
vmap <silent> <C-e> $
"" Beginning of line
imap <silent> <C-a> <Left><ESC><S-i>
nnoremap <silent> <C-a> <S-i><ESC>
vmap <silent> <C-a> 0
"" Search
nnoremap <silent> <C-s> /
nnoremap <silent> <C-r> ?

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

" Slime Hack
nmap <C-c><C-c> v}:slimeSend<CR>}j
