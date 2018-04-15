set laststatus=2
set number
set ruler

set directory=~/.vim/tmp
set backupdir=~/.vim/backup
set undodir=~/.vim/undodir
set viminfo+=n~/.vim/viminfo

set shiftwidth=2
set tabstop=2

" plugs
call plug#begin('~/.vim/plugged')
    "General
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-sleuth'
	Plug 'vim-syntastic/syntastic'
	Plug 'othree/html5.vim'
	Plug 'idanarye/vim-dutyl', {'for': 'd'}
	Plug 'mattn/emmet-vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'dleonard0/pony-vim-syntax'
	Plug 'airblade/vim-gitgutter'
	Plug 'sheerun/vim-polyglot'  " collection of language packs
    "colorscheme
	Plug 'romainl/Apprentice'
	Plug 'yamasy1549/gochiusa.vim'
call plug#end()


" leader key
let mapleader="\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" d
let g:dutyl_stdImportPaths=['/usr/local/dlang/dmd']

" python
let g:syntastic_python_checkers=['pep8']
let g:syntastic_python_pep8_args=['--ignore=E501,E126,E127,W391,E221,E222,E402,W191']

" php
let g:syntastic_php_checkers = ['php']

" python path
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'



" dictionary completion deoplete or C-x C-k 
set dictionary=/usr/share/dict/words
set dictionary+=/usr/share/dict/american-english
call deoplete#custom#source('dictionary', 'sorters', [])
inoremap <C-d> <C-x><C-k>

" colorscheme
" colorscheme apprentice
colorscheme gochiusa

let g:ctrlp_custom_ignore = {
  \ 'dir':  '(\.(git|hg|svn)$)|(^vendor$)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set signcolumn=yes
