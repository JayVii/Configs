" Spellcheck
setlocal spell spelllang=en_gb
syntax spell toplevel "spell-bug workaround 

" Column-limits
set colorcolumn=0

" soft wrapping
set wrap

" highlight 'bad words'
" ENG: https://mashable.com/2015/05/03/words-eliminate-vocabulary/
" GER: https://www.businessinsider.de/diese-3-woerter-solltet-ihr-in-e-mails-an-kollegen-nicht-benutzen-2016-10
match Todo /\<that\>\c\|\<went\>\c\|\<honestly\>\c\|\<absolutely\>\c\|\<very\>\c\|\<really\>\c\|\<amazing\>\c\|\<always\>\c\|\<never\>\c\|\<literally\>\c\|\<just\>\c\|\<maybe\>\c\|\<stuff\>\c\|\<thing\>\c\|\<irregardless\>\c\|\<eigentlich\>\c\|\<entschuldigung\>\c\|\<mir\>\c/

hi Todo guibg=None ctermbg=None guifg=Green ctermfg=Green
