scriptencoding utf-8
" use multibyte string in .vimrc

" set base element
set number
set imdisable
set showmatch
set cursorline

" setting about indent
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

nnoremap > V>
nnoremap < V<
nnoremap = V=

" setting about comment
" augroup auto_comment_off
" 	autocmd!
" 	autocmd BufEnter * setlocal formatoptions-=r
" 	autocmd BufEnter * setlocal formatoptions-=o
" augroup END


set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
" setting neobundle.vim
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand("~/.vim/bundle/"))
NeoBundleFetch "Shougo/neobundle.vim"
	NeoBundle "Shougo/unite.vim"
		NeoBundle "Shougo/neomru.vim"
		NeoBundle "ujihisa/unite-colorscheme"
	NeoBundle "Shougo/vimshell.vim"
	NeoBundle "Shougo/neocomplete.vim"
	NeoBundle "Shougo/neosnippet.vim"
		NeoBundle "Shougo/neosnippet-snippets"
	NeoBundle "Shougo/context_filetype.vim"
	NeoBundle "Shougo/vimproc",{"build":{"mac":"make -f make_mac.mak"}}
	NeoBundle "Shougo/vinarise"
	NeoBundle "tyru/restart.vim"
	NeoBundle "tyru/caw.vim"
	NeoBundle "thinca/vim-quickrun"
	NeoBundle "osyo-manga/vim-precious"
	NeoBundle "altercation/vim-colors-solarized"
	NeoBundle "mattn/gist-vim", {"depends": "mattn/webapi-vim"}
	NeoBundle "mattn/emmet-vim"
        NeoBundle "nanotech/jellybeans.vim"
call neobundle#end()
NeoBundleCheck
filetype plugin indent on

"Color Scheme
set background=light

"QuickRun.vim
let g:quickrun_config={"_":{"hook/time/enable":1}, "cpp":{"command":"clang++", "cmdopt":"-std=c++1y -Wall"}}
nnoremap <silent><C-q> :QuickRun &filetype
"nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions():"\<C-c>"

"tyru/caw.vim
nmap <C-c> <Plug>(caw:I:toggle)
vmap <C-c> <Plug>(caw:I:toggle)

"neocomplete.vim
let g:neocomplete#enale_at_startup=1

"neosnippet.vim
let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory="~/.vim/bundle/neosnippet-snippets/neosnippets"

" gist.vim
let g:gist_clip_command = "pbcopy"
let g:gist_detect_filetype = 1

"neosnippet-keymap
	imap <C-g> <Plug>(neosnippet_expand_or_jump)
	smap <C-g> <Plug>(neosnippet_expand_or_jump)
	xmap <C-g> <Plug>(neosnippet_expand_target)

	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)"
	\: "\<TAB>"

	if has('conceal')
		set conceallevel=2 concealcursor=i
	endif

"unite-keymap
	nnoremap [unite] <Nop>
	nmap <Space>u [unite]
	"
	nnoremap [unite]c :Unite colorscheme -auto-preview
	nnoremap [unite]f :Unite file<CR>
	nnoremap [unite]m :Unite file_mru<CR>

"vimrc-keymap
	nnoremap [vimrc] <Nop>
	nmap <Space>v [vimrc]
	"
	nnoremap [vimrc]l :source ~/.vimrc<CR>
	nnoremap [vimrc]e :e ~/.vimrc<CR>

"emmet-vim


syntax enable
colorscheme jellybeans
set background=dark
