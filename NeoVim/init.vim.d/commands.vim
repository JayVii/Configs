" Footnotes
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
  exe "normal o".cr."[".b:vimfootnotenumber."] " . footNoteText
  execute "normal `a"
endfunction
command FN :call Footnote()

" View PDF
function ViewPDF()
  silent ! /usr/bin/mupdf -A 8 "%:r.pdf" &
endfunction
command Vpdf :call ViewPDF()

function Contacts()
  silent ! bash -c /home/jan/Develop/bin/contacts_vcard &
endfunction
command Adr :call Contacts()

" Spellcheck DE
command SCde :setlocal spell spelllang=de

" Spellcheck EN
command SCen :setlocal spell spelllang=en_gb

" Spellcheck off
command SCoff :setlocal nospell spelllang=

" Fix Spellchecker
command SCfix :syntax spell toplevel

"Count Words and characters
command Count :w !wc -m -w

" switch top/bottom or left/right split
command Rotate :wincmd r

" Save as Root
function SaveAsRoot()
  w !sudo tee "%"
  e! "%"
endfunction
command Wroot :call SaveAsRoot()
"workaround to make 'W' not autocomplete to SaveAsRoot()
command Wnorm w 

" Translate
function Translate()
  '<,'>w !deepl translate -t "DE"
endfunction
