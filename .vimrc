function GetOS()
  if (has('win32') || has('win95') || has('win64') || has('win16'))
    return 'windows'
  elseif has('unix')
    return 'linux'
  elseif has('mac')
    return 'mac'
  endif
endfunction

let $CUR_OS = GetOS()

if $CUR_OS == 'windows'
  let $VIMRC = '$HOME/_vimrc'
  let $PLUGED = '$HOME/.vim/plugged'
else
  let $VIMRC = '~/.vimrc'
  let $PLUGED = '~/.vim/plugged'
endif

" Vim-plug {

" 如果未安装 vim-plug 需要先下载
" linux下 curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" windows下 curl -fLo %USERPROFILE%/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin($PLUGED)

" 平滑滚动
Plug 'terryma/vim-smooth-scroll'
let $PUG_vim_smooth_scroll = 1

" 光标快速移动工具
Plug 'easymotion/vim-easymotion'

" 颜色主题
Plug 'flazz/vim-colorschemes'
let $PUG_vim_colorschemes = 1

"快速切换主题
Plug 'chxuan/change-colorscheme'
let $PUG_change_colorscheme = 1

" 用符号({[  html xml标签 将内容包起来
Plug 'tpope/vim-surround'

" 括号自动补全
Plug 'jiangmiao/auto-pairs'

" 代码自动补全
"Plug 'Valloric/YouCompleteMe'

" 状态栏增强
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum' " 设置主题
"let g:airline_solarized_bg='drak' " 设置主题为暗色调
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
" 汉字乱码处理
let g:airline_powerline_fonts=0

" 编辑增强
"Plug 'chxuan/vim-edit'
"let $PUG_vim_edit = 1

" 缓存操作
Plug 'chxuan/vim-buffer'
let $PUG_vim_buffer = 1

" 目录树
Plug 'scrooloose/nerdtree'
let $PUG_nerdtree = 1
" NERDTree随vim启动
"autocmd vimenter * NERDTree
"打开文件或目录时，打开NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
" NerdTree文件类型高亮
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Disable Highlighting
"let g:NERDTreeDisableFileExtensionHighlight = 1
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1
" Highlight full name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Highlight folders using exact match
"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" NerdTree显示git状态
Plug 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }

" 显示文件类型图标
Plug 'ryanoasis/vim-devicons'

" Markdown 支持
" if you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" have nodejs and yarn
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" set to 1, the nvim will open the preview window once enter the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server only listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle'
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
"let g:mkdp_page_title = '「${name}」'

" 提供生成函数实现、函数声明/实现跳转、.h .cpp切换等功能
Plug 'chxuan/cpp-mode'
let $PUG_cpp_mode = 1

" if/end/endif/endfunction补全
Plug 'tpope/vim-endwise'

" 快速注释代码
Plug 'tpope/vim-commentary'

" 使用majutsushi/tagbar的v2.3版本，taglist的替代品，显示类/方法/变量
Plug 'godlygeek/tabular'

" 在命令区显示当前调用函数的声明
Plug 'Shougo/echodoc.vim'
set cmdheight=2

" git 集成
Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
Plug 'junegunn/gv.vim'

call plug#end()
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

" 宽字符显示为双倍宽度
if has("multi_byte")
  if v:lang =~? '^\|\|'
    set ambiwidth=double
  endif
endif

" 设置中文帮助
set helplang=cn

" 是否兼容vi，compatible为兼容，nocompatible为不完全兼容 
" 如果设置为compatible，则tab将不会变成空格 
set nocompatible
"set compatible

" 设置支持backspace向前删除(indent允许向前删除自动缩进;eol允许向前删除回行;start允许向前删除字符)
set backspace=indent,eol,start

" 启用vim自身命令行模式智能补全
set wildmenu

" 切换到普通模式后关闭输入法
set noimd

" Set to auto read when a file is changed from the outside
set autoread

" Have the mouse enabled all the time:
"set mouse=a

" 颜色主题
if $PUG_vim_colorschemes == 1
  colorscheme Monokai
  "colorscheme OceanicNext
  "colorscheme molokai
  "colorscheme ChocolatePapaya
  "colorscheme ChocolateLiquor
else
  colorscheme desert
endif

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

" 快捷键 {
" 行首和行尾
nmap lb 0
nmap le $
" 复制选中文本到系统剪贴板
vnoremap <Leader>y "+y
" 支持 Ctrl + c 复制
vnoremap <silent> <c-c> "+y
" 粘贴系统剪贴板内容
nmap <Leader>p "+p
" 支持 Ctrl + v 粘贴
nmap <silent> <c-v> "+p
" 保存当前窗口内容
nmap <Leader>w :w<CR>
" 支持 Ctrl + s 保存
nmap <silent> <c-s> :w<CR>
" 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 保存所有窗口内容并退出
nmap <Leader>WQ :wa<CR>:q<CR>
" 不保存关闭所有窗口
nmap <Leader>Q :qa!<CR>
" 在结对符之间跳转
nmap <Leader>[ %
" 利用sudo权限保存只读文件
nmap <leader>sudo :w !sudo tee %

if $PUG_vim_edit == 1
  nnoremap Y :CopyText<cr>
  nnoremap D :DeleteText<cr>
  nnoremap C :ChangeText<cr>
  nnoremap <leader>r :ReplaceTo<space>
endif

if $PUG_vim_buffer == 1
  nnoremap <c-p> :PreviousBuffer<cr>
  nnoremap <c-n> :NextBuffer<cr>
  nnoremap <leader>d :CloseCurrentBuffer<cr>
  nnoremap <leader>D :BufOnly<cr>
endif

if $PUG_nerdtree == 1
  nnoremap <leader>n :NERDTreeToggle<cr>
endif

if $PUG_vim_smooth_scroll == 1
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
endif

if $PUG_change_colorscheme == 1
  nnoremap <silent> <F9> :PreviousColorScheme<cr>
  inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
  nnoremap <silent> <F10> :NextColorScheme<cr>
  inoremap <silent> <F10> <esc> :NextColorScheme<cr>
  "nnoremap <silent> <F12> :ShowColorScheme<cr>
  "inoremap <silent> <F12> <esc> :ShowColorScheme<cr>
endif

if $PUG_cpp_mode == 1
  nnoremap <silent> <F12> :GoToFunImpl<cr>
  nnoremap <leader>U :GoToFunImpl<cr>
  nnoremap <silent> <leader>a :Switch<cr>
  nnoremap <leader><leader>fp :FormatFunParam<cr>
  nnoremap <leader><leader>if :FormatIf<cr>
endif

" } 快捷键

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
autocmd! bufwritepost .vimrc source $VIMRC  

" 设置重新载入.vimrc快捷键
  map <silent> <leader>ss :source $VIMRC<cr> 

" 设置快速编辑.vimrc快捷键
  map <silent> <leader>ee :e $VIMRC<cr>

