syntax on

colorscheme default

let mapleader=" "

set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set hlsearch
set incsearch
set clipboard=unnamed,unnamedplus

noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

noremap H ^
noremap L $

inoremap <C-c> <Esc>

nnoremap <leader>sf :action GotoFile<CR>
nnoremap <leader>sg :action SearchEverywhere<CR>
nnoremap <leader>b :action Back<CR>
nnoremap <leader>f :action Forward<CR>
nnoremap <leader>wo :action CloseAllEditorsButActive<CR>
nnoremap <leader>e :action SelectInProjectView<CR>

nnoremap grn :action RenameElement<CR>
nnoremap grd :action GotoDeclaration<CR>
nnoremap grr :action FindUsages<CR>
