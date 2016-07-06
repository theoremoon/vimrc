set autoread	" よそでファイルが変更されたら読み込む
set hidden	" ファイルをロックしない（編集中でもほかから開ける
set vb t_vb=	" Beep音を消す
set showcmd	" 現在のコマンドを表示
set showmode 	" 現在のモードを表示
set number
set cursorline	" カーソル行をハイライト
set nocompatible
set virtualedit+=block " 矩形選択で自由に移動

comclear
command! Ev edit $MYVIMRC	" Evコマンドでvimrcを編集
command! Rv source $MYVIMRC	" Rvコマンドでvimrcを読みこみ

augroup vimrc
	autocmd!
	autocmd vimrc BufEnter * lcd %:p:h " 開いているファイルのディレクトリをカレントディレクトリにする（ローカル
augroup END


set autoindent	" 自動インデント
set smartindent " 新しい行を開始したとき、新しい行のインデントを現在と同じにする
set cindent	" Cプログラムファイルの自動インデント
set indentexpr=GetVimIndent()  " VimScriptを用いて、インデントを計算する

set tabstop=2
set shiftwidth=2
set softtabstop=0	" Tabで入力される空白の量。0にするとtabstopの値になる
set textwidth=0

if has("autocmd")
	filetype plugin on	" ファイルタイプが変更されたとき、ファイルタイプ用のプラグインを自動読み込み
	filetype indent on	" インデント設定を自動読み込み
endif


" 前回の編集位置に移動
nnoremap gb '[ 
nnoremap gp ']

set laststatus=2	" 常にステータスラインを表示
set ruler		" ルーラを表示

syntax enable	" ハイライトする
