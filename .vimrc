set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" vundle {
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" 如果在windows下使用的话，设置为
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/') 
" }
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

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
" } 快捷键

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" 是否兼容vi，compatible为兼容，nocompatible为不完全兼容 
" 如果设置为compatible，则tab将不会变成空格 
set nocompatible

" 启用vim自身命令行模式智能补全
set wildmenu

" 切换到普通模式后关闭输入法
set noimd

" 汉字乱码处理
let g:airline_powerline_fonts=0

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
set expandtab
" 不要将制表符扩展为空格
"set noexpandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
"显示TAB健 
set list
set listchars=tab:>-,trail:-

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 显示光标当前位置
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
