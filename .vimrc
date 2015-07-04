scriptencoding utf-8
"vimrcで日本語を使うための設定

" エンコーディング
  set encoding=utf-8
  set termencoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8,cp932

" 改行コード
set fileformats=unix,dos,mac

" viとの互換性を保たない
set nocompatible

" バックアップファイル
  " swapファイル
  if ! isdirectory($HOME.'/.vim/swap')
    call mkdir($HOME.'/.vim/swap', 'p')
  endif
  set directory=$HOME.'/.vim/swap'

  " .un~ファイル
  if has('persistent_undo')
    if ! isdirectory($HOME.'/.vim/undo')
      call mkdir($HOME.'/.vim/undo', 'p')
    endif
    set undodir=$HOME/.vim/tmp
    set undofile
  endif

  " .~ファイル
  set backupdir=$HOME/.vim/tmp

" 言語設定
language message C
language time C

" インデント周り
  " 自動インデント
  " set autoindent
  " かしこいんでんと
  " set smartindent
  " さらにかCこいんでんと
  set cindent

  " Tab文字の幅
  set tabstop=2
  " 自動インデントで何レベルインデントするか
  set shiftwidth=2
  " Tabの代わりに挿入される空白の量
  set softtabstop=2
  " インデントをshiftwidthの値の倍数に丸める
  set shiftround
  " 賢いタブ
  set smarttab

  " タブの代わりにスペースを挿入
  set expandtab

  "折り返しでインデント保持
  if exists('+breakindent')
    set breakindent
    set breakindentopt=shift:-2
    let &showbreak = '> '
  endif

" 長い行は折り返し
set wrap

" ウィンドウをなるべく30文字以上入るサイズに
set winwidth=30

" 検索まわり
  " 検索がぐるっとまわる
  set wrapscan

  " 大文字小文字を区別しない
  set ignorecase
  " 賢く大文字小文字を区別
  set smartcase

  " 検索結果ハイライト
  set hlsearch

  " 検索途中にもカーソルを動かす(ように見せる
  set incsearch

" 括弧を入力すると対応する括弧に僅かの間ジャンプする
set showmatch

" カーソル位置を表示
set ruler

" ステータス行を常に表示
set laststatus=2

" スクロールした時にちょとｔ余白
set scrolloff=5

" ビープ音しない
set vb t_vb=

" 起動時メッセージ消す
set shortmess& shortmess+=I

" InputMethod周り
  "IMを使う
  set noimdisable
  " 起動時にIMをOFF
  set iminsert=0 imsearch=0
  "コマンドラインでのIM無効化
  set noimcmdline

" 改行のときコメント続けない設定
  set formatoptions-=r
  set formatoptions-=o

" 日本語ヘルプ見る
set helplang=ja,en

" OSのクリップボード使う
set clipboard=unnamed

" 矩形選択で自由に移動
set virtualedit& virtualedit+=block

" 行を折り返さない
set textwidth=0

" コマンドの実行中は再描画しない
set lazyredraw

" ソースコードの折りたたみする
  set foldenable
  set foldmethod=marker

" マルチバイト文字への表示対応
set ambiwidth=double

" ステータスライン
set rulerformat=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
set statusline=%f:\ %{substitute(getcwd(),'.*/','','')}\ %m%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B

" リストヘッダ
set formatlistpat&
let &formatlistpat .= '\|^\s*[*+-]\s*'

" 一定時間操作しない時に、カーソルラインを強調
autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
autocmd CursorHold,CursorHoldI,WinEnter * setlocal cursorline

" md拡張子はmarkdown
autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown

" カレントパスをクリップボードにコピー
command! CopyCurrentPath :call s:copy_current_path()
function! s:copy_current_path()
  if has('win32') || has('win64')
    let c = substitute(expand('%:p'), '\\/', '\\', 'g')
  elseif has('unix')
    let c = expand('%:p')
  endif

  if &clipboard ==# 'plus$'
    let @+ = c
  else
    let @* = c
  endif
endfunction

" 文字数カウント
command! -nargs=0 Wc %s/.//nge

" --- --- --
" プラグインまわり
" --- --- --

" NeoBundleがなければインストール
if ! isdirectory(expand($HOME.'/.vim/bundle'))
  echon "Installing neobundle.vim..."
  silent call mkdir(expand($HOME.'/.vim/bundle'), 'p')
  silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
  echo "done."
  if v:shell_error
    echoerr "neobundle.vim installation has failed!"
    finish
  endif
endif

" NeoBundleの設定
if has('vim_starting')
  set runtimepath+=expand($HOME.'/.vim/bundle/neobundle.vim')
endif

call neobundle#begin(expand($HOME.'/.vim/bundle'))
NeoBundleFetch "Shougo/neobundle.vim"
call neobundle#end()
NeoBundleCheck
filetype plugin indent on


""" 参考というかぱくり
""" https://github.com/rhysd/dotfiles/blob/master/vimrc
