execute pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call plug#begin('~/.vim/plugged')

" This is our list of plugins to install
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'

call plug#end()

"""
" Basic config setup
"""

" Standard Vim configuration boilerplate
syntax on
filetype plugin indent on
set t_Co=256
set encoding=utf-8

" Bind "jj" to <esc> to jump out of insert mode
inoremap jj <esc>

let mapleader = "\<Space>"

" Custom configuration begins

" With this, you can enter ":command" in normal mode to open the Vim
" configuration.
command! Config execute ":e $MYVIMRC"

" Call ":Reload" to apply the latest .vimrc contents
command! Reload execute "source ~/.vimrc"

" Be kind to ourselves and enable the mouse
if has('mouse')
  set mouse=a
endif

"""
" FZF
"""

" Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" Bind "//" to a fzf-powered buffer search
nmap // :BLines!<CR>

" Bind "??" to a fzf-powered project search
nmap ?? :Rg!<CR>

" Bind "<leader>p" to a fzf-powered filename search
nmap <leader>p :Files!<CR>

" Bind "cc" to a fzf-powered command search
nmap cc :Commands!<CR>

"""
" NERDTree
"""

let NERDTreeShowHidden=1

function! ToggleNERDTree()
  NERDTreeToggle
  " Set NERDTree instances to be mirrored
  silent NERDTreeMirror
endfunction

" Bind "<leader>n" to toggle NERDTree
nmap <leader>n :call ToggleNERDTree()<CR>

"""
" CtrlSF
"""

" Set "<leader>s" to substitute the word under the cursor. Works great with
" CtrlSF!
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Set up some handy CtrlSF bindings
nmap <leader>a <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>c :CtrlSFFocus<CR>
nmap <leader>C :CtrlSFToggle<CR>

" Use Ripgrep with CtrlSF for performance
let g:ctrlsf_ackprg = '/usr/bin/rg'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BONUS SECTION!
"
" You can easily open external interactive command line tools from within Vim.
" This isn't for everyone, but it's a convenient way to quickly open a non-Vim
" tool that you frequently use briefly. This example opens lazygit in a Vim
" term tab.  As soon as lazygit exits, the term tab is closed.
"
" https://github.com/jesseduffield/lazygit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <leader>g :tab term ++close lazygit<CR>
