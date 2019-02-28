" vundle {
" 利用git安装vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" 如果在windows下使用的话，设置为
"set rtp+=$VIM/vimfiles/bundle/vundle/
"call vundle#rc('$VIM/vimfiles/bundle/') 

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" 用符号({[  html xml标签 将内容包起来
Bundle 'tpope/vim-surround'
" 括号自动补全
Bundle 'jiangmiao/auto-pairs'
" 代码自动补全
"Bundle 'Valloric/YouCompleteMe'

" 状态栏增强
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized' " 设置主题
let g:airline_solarized_bg='drak' " 设置主题为暗色调
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
" }

" 自定义设置 {

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据不同文件类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on

" 快捷键 {
" 行首和行尾
nmap lb 0
nmap le $
" 复制选中文本到系统剪贴板
vnoremap <Leader>y "+y
" 粘贴系统剪贴板内容
nmap <Leader>p "+p
" 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 保存当前窗口内容
nmap <Leader>w :w<CR>
" 保存所有窗口内容并退出
nmap <Leader>WQ :wa<CR>:q<CR>
" 不保存关闭所有窗口
nmap <Leader>Q :qa!<CR>
" 在结对符之间跳转
nmap <Leader>[ %
" 利用sudo权限保存只读文件
nmap <leader>sudo :w !sudo tee %
" } 快捷键

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" 打开文件时尝试指定的编码方式解码
set fencs=utf-8,gbk,utf-16,big5,gb2312,gb18030
" 设置终端编码
set termencoding=utf-8
" Vim 内部使用的字符编码方式(包括 Vim 的 buffer、菜单文本、消息文本等)
set encoding=utf-8

" 设置中文帮助
set helplang=cn

" 是否兼容vi，compatible为兼容，nocompatible为不完全兼容 
" 如果设置为compatible，则tab将不会变成空格 
set nocompatible
"set compatible

" 设置支持backspace向前删除(indent允许向前删除自动缩进;eol允许向前删除回行
" ;start允许向前删除字符)
set backspace=indent,eol,start

" 启用vim自身命令行模式智能补全
set wildmenu

" 切换到普通模式后关闭输入法
set noimd

" 汉字乱码处理
let g:airline_powerline_fonts=0

" Set to auto read when a file is changed from the outside
set autoread

" Have the mouse enabled all the time:
"set mouse=a

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏(默认值为1, 无法显示状态栏)
set laststatus=2
"启动的时候不显示那个援助儿童的提示 
set shortmess=atI
" 命令行的高度，默认为1
set cmdheight=2

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 允许代码折叠
set foldenable
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable

" 将制表符扩展为空格
"set expandtab
" 不要将制表符扩展为空格
set noexpandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
"显示TAB健 
set list
set listchars=tab:>-,trail:-
" 根据文件类型设置缩进格式
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 显示光标位置
set ruler
" 显示行号
set number
" 高高显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 高亮显示匹配的括号
set showmatch
" 禁止折行
set nowrap
"正确地处理中文字符的折行和拼接 
set formatoptions+=mM

" 缺省不产生备份文件 
set nobackup
" 不生成undo文件
set noundofile
"set undodir=~/.undodir
"set undofile
" 不生成临时文件
set noswapfile
"set swapfile

" } 自定义设置

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" 配置文件.vimrc更改后自动重新载入使设置生效
autocmd! bufwritepost .vimrc source ~/.vimrc  

" 设置重新载入.vimrc快捷键
map <silent> <leader>ss :source ~/.vimrc<cr> 

" 设置快速编辑.vimrc快捷键
map <silent> <leader>ee :e ~/.vimrc<cr>

