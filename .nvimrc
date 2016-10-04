set nocompatible
filetype off

runtime macros/matchit.vim

" not sure why this is necessary...
" http://www.reddit.com/r/neovim/comments/2z538d/backspace_only_works_if_my_nvimrc_is_completely/
set backspace=indent,eol,start

set shell=/bin/bash

set runtimepath^=~/.nvim/bundle/ctrlp.vim

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'slim-template/vim-slim'
Plug 'rust-lang/rust.vim'
call plug#end()

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc shiftwidth=4 softtabstop=4

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

let g:deoplete#enable_at_startup = 1

filetype plugin indent on
syntax on

set background=dark
colorscheme solarized

set relativenumber
set number

" associate *.purs with haskell filetype
au BufRead,BufNewFile *.purs setfiletype haskell

set guifont=Monaco:h20

" use old regex engine to fix performance issues with Ruby syntax
" highlighting
" see http://stackoverflow.com/a/16920294
set re=1

let mapleader=","

set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
set ruler

set hlsearch

set autoindent
set smartindent
filetype indent on

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd! BufWritePost * Neomake

autocmd FileType rust setlocal shiftwidth=4 softtabstop=2

" Map enter to insert row without entering insert mode
map <cr> o<esc>

" Save all open buffers and run rspec on the current file
map <Leader>r :wa\|!bundle exec rspec % --no-color<cr>

" Save all open buffers and run minitest on the current file
map <Leader>m :wa\|!bundle exec ruby -I test %<cr>

" Leave insert mode by pressing jk; this might be stupid idea
inoremap jk <esc>

" Manual autocompletion
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" Show dotfiles by default.
let g:ctrlp_show_hidden = 1
" Ignore some files for CtrlP's index.
set wildignore+=*.beam,*/deps/*,*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*/.stack-work/*
nnoremap <leader>. :CtrlPTag<cr>

" Remove surrounding parentheses
map <leader>p %x``xi<space><esc>

" Swap argument under cursor with next argument
map <leader>a viwdwvepbbp

" Inline variable
map <leader>v *NNwwy$nviwpNdd:nohl<cr>

" Replace double quotes with single quotes within the current selection
map <leader>' :s/"/'/g<cr>:nohl<cr>

" Replace single quotes with double quotes within the current selection
map <leader>" :s/'/"/g<cr>:nohl<cr>

" Compile current file using elm-make
map <leader>e :wa\|!elm-make %<cr>

" Hack to get rid of Mac OS X bug when switching to fullscreen
map <leader>h :sp<cr>:wincmd k<cr>:q<cr>

" Search using ag for current search
map <leader>s :AgFromSearch<cr>

" Remove highlighting
map <leader>n :nohl<cr>

" this is borrowed from Gary Bernhardt (https://github.com/garybernhardt/dotfiles/blob/f0c0ff92209e5aed4fa3ef6faf056eb9944a8f12/.vimrc)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Tab completion during insert mode
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

map <leader>t :CtrlP<cr>

map <leader>c :s/^/\/\//<cr>:nohl<cr>
map <leader>u :s/^\/\//<cr>:nohl<cr>

map <silent> ]t :GhcModType<cr>
map <silent> ]c :GhcModTypeClear<cr>
map <silent> ]l :GhcModLint<cr>
map <silent> ]s :GhcModSplitFunCase<cr>
map <silent> ]g :GhcModSigCodegen<cr>

" split pane management
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
