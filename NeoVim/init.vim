""""""""""""""" NEOVIM CONFIG """""""""""""""
"
" Maintainer:
" JayVii
" jayvii@posteo.de
" http://jayvii.de
" http://jayvii.de/git
"
" Requirements:
" vim or neovim
" vim-plug (https://github.com/junegunn/vim-plug)
"
"""""""""""""""""""""""""""""""""""""""""""""

" Default for all filetypes
source ~/.config/nvim/init.vim.d/defaults.vim
source ~/.config/nvim/init.vim.d/plugins.vim
source ~/.config/nvim/init.vim.d/commands.vim
source ~/.config/nvim/init.vim.d/keybinds.vim
source ~/.config/nvim/init.vim.d/theme.vim

" Text filetypes
autocmd BufRead,BufNewFile *.md source ~/.config/nvim/init.vim.d/text.vim
autocmd BufRead,BufNewFile *.txt source ~/.config/nvim/init.vim.d/text.vim
autocmd BufRead,BufNewFile *.tex source ~/.config/nvim/init.vim.d/text.vim
autocmd BufRead,BufNewFile *.bib source ~/.config/nvim/init.vim.d/text.vim

" Code filetypes
autocmd BufRead,BufNewFile *.R source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.py source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.sh source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.run source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.html source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.css source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.js source ~/.config/nvim/init.vim.d/code.vim
autocmd BufRead,BufNewFile *.vim source ~/.config/nvim/init.vim.d/code.vim

" Mail
autocmd BufRead,BufNewFile *.astroid@*.none source ~/.config/nvim/init.vim.d/mail.vim

" EOF
