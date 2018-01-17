"如果通过tmux运行，执行以下命令
if exists('$TMUX')
	set term=screen-256color
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype on                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" My Plugins 

" solarized theme
Plugin 'altercation/vim-colors-solarized'

" 自动补全
Plugin 'valloric/youcompleteme'

" nerdtree
Plugin 'scrooloose/nerdtree'

" 自动缩进
Plugin 'vim-scripts/indentpython.vim'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 补全括号
Plugin 'auto-pairs'

" 文件搜索
Plugin 'kien/ctrlp.vim'

" 注释插件
Plugin 'scrooloose/nerdcommenter'

" 多光标
Plugin 'terryma/vim-multiple-cursors'

" indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Colors and Fonts

" solarized theme
syntax enable
set background=dark
colorscheme solarized

" 在Gvim中设置英文用Hermit,中文用YaHei Mono
if has('win32')
         set guifont = Hermit:h13
         set guifontwide = Microsoft_YaHei_Mono:h12
endif


let g:solarized_termcolors = 256
let g:solarized_termtrans = 1

""""""""""""""" Plugin-Configure

" nerdtree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let g:SimplyFold_docstring_preview = 1
let python_heightlight_all = 1
syntax on

" airline
let g:airline_theme = "luna"

" 这个是安装字体后 必须设置的项
let g:airline_powerline_fonts = 1

" 打开tabline功能方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置切换Buffer的快捷建
nnoremap <C-N> :bn<CR>
nnoremap <C-p> :bp<CR>

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = "!"

" ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_working_path_mode = 'ca'

set wildignore+=*/tmp/*,*so,*.swp,*.zip,*/node_modules/*,*/dist/*

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'some_bad_symbolic_links',
	\ }

" Nerd-commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1"

" indent Guides
" 随vim自启动
let g:indent_guides_enable_on_vim_startup=0

" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=1

" 色块宽度
let g:indent_guides_guide_size=0

" 快捷键 i 开关缩进可视化
" nmap <silent><Leader>i<Plug>IndentGuidesToggle



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader, it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Add a bit extra margin to the left
set foldcolumn=1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
set cc=80"

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab

" 设置编辑时制表符占用的空格数
set tabstop=4

" 设置格式换时制表符占用的空格数
set shiftwidth=4

" 让vim把连续数量的空格视为一个制表符
set softtabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
 set clipboard=unnamed
 set ruler 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" 高亮列
set cursorcolumn
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

"" 高亮行
set cursorline
highlight CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" Enable folding
set foldmethod=indent
set foldlevel=99

" 禁止折行
set nowrap

" 行号
set number

" 高亮显示搜索结果
set hlsearch

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 代码折叠
 nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab切换
" nnoremap <C-m> :bn<CR>
" nnoremap <C-s-m> :bp<CR>
" nnoremap <s-w> :bdelete<CR>
"
" " 打开文件树
map <F4> :NERDTreeToggle<CR>
"
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



























