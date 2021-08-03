" Vim plug plugins

call plug#begin('~/.vim/plugged')

" telescope stuff
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Vim lightline, awesome bottom bar
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" Gruvbox
Plug 'gruvbox-community/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
" rust stuff
Plug 'rust-lang/rust.vim'
" For git integration, somewhat magit alternative
Plug 'tpope/vim-fugitive'
" LSP and autocompletion stuff
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Makes comments and auto-pairs
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
" My past changes listed to uncommit blunders
Plug 'mbbill/undotree'
" Emmet support
Plug 'mattn/emmet-vim'
" File navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' 
" React snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
" Diagnose vim
Plug 'tweekmonster/startuptime.vim'
Plug 'vimwiki/vimwiki'
" highlight with colors
Plug 'gko/vim-coloresque'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" settings
colorscheme nord

set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=8
set noshowmode
set showtabline=2
set clipboard+=unnamedplus
set completeopt=menuone,noinsert,noselect
set wildmode=longest,list,full
set signcolumn=yes
set colorcolumn=90
set updatetime=50
set shortmess+=c

set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" key bindings
let mapleader=" "
nnoremap <silent><leader>bd :bd<CR>
nnoremap <silent><leader>pi :so /home/tarun/.config/nvim/init.vim<CR>:PlugInstall<CR>
nnoremap <silent><leader>so :so /home/tarun/.config/nvim/init.vim<CR>
nnoremap <silent><leader>en :e /home/tarun/.config/nvim/init.vim<CR>
nnoremap <silent><leader>el :e /home/tarun/.config/nvim/lua/luaconfig.lua<CR>
nnoremap <silent><leader>, :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <silent><leader>u :UndotreeShow<CR><C-w><C-h>
nnoremap <silent><leader>c :Telescope colorscheme<CR>
nnoremap <silent><TAB> :bnext<CR>
nnoremap <silent><S-TAB> :bprevious<CR>
nnoremap <silent>,j :cn<CR>
nnoremap <silent>,k :cp<CR>
nnoremap <silent><leader>j :lnext<CR>
nnoremap <silent><leader>k :lprevious<CR>
nnoremap <silent><leader>s :setlocal spell! spelllang=en_us<CR>
nnoremap gp :silent %!prettier --stdin-filepath --tab-width 4 %<CR>
nmap <leader>/ gcc
vmap <leader>/ gc
nnoremap <leader>gs :G<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
map Y y$

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" function
fun! LspLocationList()
    lua vim.lsp.diagnostic.set_loclist({ open_loclist = false })
endfun

" autocmd
autocmd InsertEnter * norm zz
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
autocmd BufWritePost ~/ultraboi/sockless/dwmblocks/config.def.h !cd ~/ultraboi/sockless/dwmblocks; doaspass make install && { killall -q dwmblocks;setsid dwmblocks & }
autocmd BufWritePost ~/ultraboi/sockless/dwm/config.def.h !cd ~/ultraboi/sockless/dwm; doaspass cp config.def.h config.h; doaspass make install 
autocmd BufWritePost ~/.config/xres/current !xrdb -merge ~/.config/xres/current; xdotool key super+F5; alacritty-xres > ~/.config/alacritty/colors.yml
autocmd BufEnter * lua require'completion'.on_attach()

let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_hide_dotfiles = 0
let g:user_emmet_settings = {
\ 'typescript' : {
\     'extends' : 'jsx',
\ },
\}
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:completion_chain_complete_list = { 
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [
            \       {'complete_items': ['path']}]
            \   }
            \ }

let g:UltiSnipsExpandTrigger="<c-l>"
" Lua file: /home/tarun/.config/nvim/lua/luaconfig.lua
lua require('luaconfig')
