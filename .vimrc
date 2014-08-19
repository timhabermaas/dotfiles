set nocompatible
filetype off

runtime macros/matchit.vim

" use vundle package manager
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'

filetype plugin indent on

colorscheme Tomorrow-Night-Eighties

set relativenumber
set number

set guifont=Monaco:h20

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

" Map enter to insert row without entering insert mode
map <cr> o<esc>

" Save all open buffers and run rspec on the current file
map <Leader>r :wa\|!bundle exec rspec % --no-color<cr>

" Leave insert mode by pressing jk; this might be stupid idea
inoremap jk <esc>

" Show dotfiles by default.
let g:ctrlp_show_hidden = 1
" Ignore some files for CtrlP's index.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
nnoremap <leader>. :CtrlPTag<cr>

" Remove surrounding parentheses
map <leader>p %x``xi<space><esc>

" Swap argument under cursor with next argument
map <leader>a viwdwvepbbp

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
map <leader>w <C-w><C-w>

" split pane management
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
