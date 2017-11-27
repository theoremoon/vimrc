set sw=4
set ts=4
set laststatus=2
set number
set ruler

" plugs
call plug#begin('~/.vim/plugged')
    "General
	Plug 'Shougo/denite.nvim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-endwise'
	Plug 'tyru/caw.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'tpope/vim-fugitive'
    "php
        Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install', 'for': 'php' }
	"clojure
		Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
		Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
		Plug 'tpope/vim-dispatch', { 'for': 'clojure' }
		Plug 'tpope/vim-salve', { 'for': 'clojure' }
	"d
		Plug 'landaire/deoplete-d', {'for': 'd'}
		Plug 'idanarye/vim-dutyl', {'for': 'd'}
	"go
		Plug 'fatih/vim-go', {'for': 'go'}
    "colorscheme
	Plug 'romainl/Apprentice'
    "My plugins
	Plug 'theoldmoon0602/codecolor'
	Plug 'theoldmoon0602/vim-eval'
call plug#end()


" leader key
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>

" copy and paste
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" do not overwrite register on replacing paste
function! RestoreRegister()
	let @"=s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg=@"
	return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

let g:deoplete#enable_at_startup = 1

" Denite key mappings
nnoremap <Leader>t :Denite tag<CR>
nnoremap <Leader>o :Denite outline<CR>
nnoremap <C-p> :Denite file_rec<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" php
let g:syntastic_php_checkers = ['php']

" d
let g:deoplete#sources#d#dcd_server_autostart=1

augroup goCmds
	autocmd!
	autocmd BufWritePost *.go :GoErrCheck
augroup END

" dictionary completion deoplete or C-x C-k 
set dictionary=/usr/share/dict/words
set dictionary+=/usr/share/dict/american-english
call deoplete#custom#source('dictionary', 'sorters', [])
inoremap <C-d> <C-x><C-k>

" colorscheme
colorscheme apprentice
