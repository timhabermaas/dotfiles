set runtimepath^=~/.vim/bundle/ctrlp.vim

set relativenumber

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
map <Leader>r :wa\|!rspec % --no-color<cr>

" Leave insert mode by pressing jk; this might be stupid idea
inoremap jk <esc>

nnoremap <leader>. :CtrlPTag<cr>

" Remove surrounding parentheses
map <leader>p %x``x

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

