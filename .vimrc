" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" ===============================================================
"
" vim键盘映射
"
" vim五种映射
" 1. 普通模式
" 2. 可视模式
" 3. 操作符等待模式
" 4. 插入模式/替换模式
" 5. 命令行模式
"
" 命令组合前缀
" nore - 表示非递归的映射
" n - 表示普通模式下生效
" v - 表示在可视莫斯下生效
" i - 表示在插入模式下生效
" c - 表示在命令行模式下生效
"
" 普通模式的映射命令
" 1. :map {lhs} {rhs}
"    在:map作用的模式中把键{lhs}映射为{rhs}，{rhs}可进行递归映射
" 2. :noremap ts td
"    与:map命令相同，但是{rhs}不能进行递归映射
" 3. :unmap td
"    取消:map绑定的{lhs}
" 4. mapclear
"    取消所有:map绑定
"
" 只用于普通模式的
" 1. :nmap
"    :nmap是:map的普通模式版，绑定的键只作用于普通模式
" 2. :nnoremap
"    :nnoremap是:nmap的非递归版本
" 3. :nunmap
"    :nunmap是取消:nmap的绑定
" 4. :nmapclear
"    取消所有:nmap的绑定
" 
" {rhs}之前可能显示一个特殊字符
" * - 表示不可重映射
" & - 表示仅脚本的局部映射可以被重映射
" @ - 表示缓冲区的局部映射
"
" 键表
" <k0> - <k9> - 表示小键盘的0-9
" <S-...> - 表示Shift + 某键
" <C-...> - 表示Ctrl + 某键
" <M-...> - 表示Alt/meta + 某键
" <A-...> - 同<M-...>
" <Esc> - esc键
" <Up> - 光标上移键
" <Space> - 插入空格
" <Tab> - 插入Tab
" <CR> - 等于<Enter>
"
" <buffer> - 如果映射命令的一个参数是<buffer>，映射将值局限于当前缓冲区内
" <silent> - 指执行键绑定时不再命令行上回显
" <special> - 一般用于定义特殊键怕有副作用场合
" <expr> -
" 如果定义新映射的第一个参数是<expr>，那么参数会作为表达式来进行计算，结果使用实际使用的
" <unique> -
" 一般用于定义新的键映射或缩写命令的同时检查是否该键已经被映射，如果该映射或者缩写已经存在，则该命令会失败
" <Leader>和mapleader
" mapleader对所有map映射命令起效，它的作用是将参数<leader>替换成mapleader变量的值
" 
" <LocalLeader>和maplocalleader
" <LocalLeader>和<Leader>相似，只是作用域缓冲区
"
" ===============================================================
"
" vim下终端使用方法
" 1. vim -> <C-z> -> terminal, terminal -> fg -> vim
" 2. vim -> :!    -> terminal, terminal -> <Enter> -> vim
" 3. tumx
"
" ===============================================================

" 开启文件类型侦测
filetype on

" 根据注册到的不同类型加在对应的插件
filetype plugin on

" 快捷键
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 设置快捷键将选中文本复制至系统剪贴板
vnoremap <Leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴到vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 定义快捷键保存所有窗口内容并退出vim
nmap <Leader> WQ :wa<CR>:q<CR>

" 不做任何保存，直接退出vim
nmap <Leader>Q :qa!<CR>

" 依次遍历子窗口
nnoremap nw <C-W><C-w> 

" 跳转到右方的窗口
nnoremap <Leader>lw <C-W>l

" 跳转到左方的窗口
nnoremap <Leader>hw <C-W>h

" 跳转到上方的窗口
nnoremap <Leader>kw <C-W>k

" 跳转到下方的窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符跳转
nmap <Leader>M %

" 配色方案
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" se t_Co=256
let g:solarized_termcolors=16
" solarized 设置
" let g:solarized_visibility='high'
" let g:solarized_contrast="high"
" 让solarized使用终端背景
let g:solarized_termtrans=1
" 设置solarized风格为dark
set background=dark
colorscheme solarized

" 字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim自身命令行模式智能补全
set wildmenu

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
" 总在中间
" set scrolloff=999
" 上面的简写
" :se so=999

" 自适应不同语言的只能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab

" 设置编辑时制表符占用的空格数
set tabstop=4

" 设置格式化时制表符占用空格符
set shiftwidth=4

" 让vim把连续数量的空格视为一个制表符
set softtabstop=4

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工作条
set guioptions-=m
set guioptions-=T

" 辅助信息
" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启绝对行号显示
set number
" 取消绝对行号显示
" set nonumber
" 显示相对行号
" set relativenumber
" set norelativenumber

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 设置自动缩进，vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进)
set autoindent

" cindent是特别针对c语言语法的自动缩进
set cindent

" 依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写有用

" vundle 环境配置
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

" 书签可视化
Plugin 'kshenoy/vim-signature'

" 让书签高亮
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'

" 基于标签的标识符列表插件
Plugin 'majutsushi/tagbar'

" 如何自动生成标签并引入
Plugin 'vim-scripts/indexer.tar.gz'
" 上面插件依赖下面两个插件
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

" 上下文插件，例如搜索到关键字，中间缩略，展示一段上下文
Plugin 'dyng/ctrlsf.vim'

" 多光标编辑功能
Plugin 'terryma/vim-multiple-cursors'

" 快速开关注释
Plugin 'scrooloose/nerdcommenter'

" ASCII art风格的注释
Plugin 'vim-scripts/DrawIt'

" 模板补全插件
Plugin 'SirVer/ultisnips'

" 随键而全的、支持模糊搜索的、高速补全的插件
Plugin 'Valloric/YouCompleteMe'

" 根据类声明自动生成类实现的代码框架
Plugin 'derekwyatt/vim-protodef'

" 查看文件列表
Plugin 'scrooloose/nerdtree'

" 显示多个buffer对应的window
Plugin 'fholgado/minibufexpl.vim'

" 快捷键选中'<>','[]','{}'中间的内容
" 这个与自动以快捷键冲突
Plugin 'gcmt/wildfire.vim'

" 有机会撤销最近一步或多不操作
Plugin 'sjl/gundo.vim'

" 快速移动,两次'<Leader>'作为前缀键
Plugin 'Lokaltog/vim-easymotion'

" 编辑markdown文档，自动开启firefox为你显示markdown最终效果
"Plugin 'suan/vim-instant-markdown'

" 中/英输入平滑切换
"Plugin 'lilydjwg/fcitx.vim'

" 支持大多数语言代码高亮
Plugin 'sheerun/vim-polyglot'

" 文件搜索
Plugin 'wincent/command-t'

" 显示git diff 和 stages/undoes 片段
Plugin 'airblade/vim-gitgutter'

" 解决中文输入法下面无法使用命令
" Plugin 'ybian/smartim'

" 语法高亮多种知名JS库
Plugin 'othree/javascript-libraries-syntax.vim' 

" React jsx 语法高亮
"Plugin 'mxw/vim-jsx'

" 提供快速编写xml/html的能力，如标签自动闭合等
Plugin 'othree/xml.vim'

" 实时显示颜色的功能，如#FFFFFF
Plugin 'cakebaker/scss-syntax.vim'

" css3 高亮，包括stylus,Less,Sass
Plugin 'hail2u/vim-css3-syntax'

" 文件转换 .h 和 .cpp
" Plugin 'derekwyatt/vim-fswitch'

" JavaScript 语法(ES5 and ES6)
"Plugin 'othree/yajs.vim'

" 可取代Command-T 但是现在不支持目录忽略
"Plugin 'junegunn/fzf'

" 调用外部命令行工具来进行代码风格检查
Plugin 'scrooloose/syntastic'

" 调用外部命令行工具来格式化代码
Plugin 'Chiel92/vim-autoformat'

" editorConfig
Plugin 'editorconfig/editorconfig-vim'

" typescript
"Plugin 'leafgarland/typescript-vim'
"Plugin ''

" JavaScript函数定义与跳转
Plugin 'ternjs/tern_for_vim'

" 括号配对
Plugin 'Raimondi/delimitMate'

" 插件列表结束
call vundle#end()

filetype plugin indent on

" 插件设置
" powerline
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" vim-indent-guides
" 随vim自启动
"let g:indent_guides_enable_on_vim_startup=1
"
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
"
" 色块宽度
"let g:indent_guides_size=1
"
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" indentLine
let g:indentLine_char = '┊'

" 代码折叠
" 基于缩进或语法进行代码折叠,indent-基于缩进折叠,syntax-基于语法进行折叠,diff-未更改文本折叠,manual-手动建立折叠
set foldmethod=indent
"set foldmethod=syntax

" 启动vim时关闭折叠代码
set nofoldenable

" 'kshenoy/vim-signature'
" 书签可视化的插件
" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" 多光标编辑
" vim-multiple-cursors
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 'majutsushi/tagbar'
" 基于标签的标识符列表插件
" 需要安装ctags `brew install ctags`
" 安装ctags 之后签列表子窗口才能出现

let tagbar_left=1                      " 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_width=32                    " 设置标签子窗口的宽度
let g:tagbar_compact=1                 " tagbar 子窗口中不显示冗余帮助信息
nnoremap <Leader>ilt :TagbarToggle<CR> " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag

" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" 代码导航
 
" 基于标签的代码导航

" 自动生成标签并引入
" 'vim-scripts/indexer.tar.gz'
" 上面插件，依赖下面两个插件
" 'vim-scripts/DfrankUtil'
" 'vim-scripts/vimprj'
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" 查找

" 上下文插件，例如搜索到关键字，中间缩略，展示一段上下文
" 'dyng/ctrlsf.vim'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in project
let g:ctrlsf_ackprg = 'rg' 
nnoremap <Leader>sp :CtrlSF<CR>
" 选中搜索 - 文本中选中关键字
vmap     <Leader>sp <Plug>CtrlSFVwordPath
" 选中搜索 - 结果列表
vmap     <Leader>sl <Plug>CtrlSFQuickfixVwordPath
vmap     <Leader>sL <Plug>CtrlSFQuickfixVwordExec

" 内容替换

" 快捷替换插件设置快捷键
" 'terryma/vim-multiple-cursors'

let g:multi_cursor_next_key='<S-n>'  " 选中下一个字符
let g:multi_cursor_skip_key='<S-k>'  " 选中跳过当前字符

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" 快速开关注释
" 'scrooloose/nerdcommenter'

" 在注释符默认添加空格
let g:NERDSpaceDelims = 1
" 使用紧凑语法美化多行注释
let g:NERDCompactSexyComs = 1
" 将行注释符左对齐而不是下面的代码缩进
let g:NERDDefaultAlign = 'left'
" 设置语言默认使用备用定界符
let g:NERDAltDelims_java = 1
" 添加自定义格式或覆盖默认值。
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" 允许注释和转换空行（注释区域时有用）
let g:NERDCommentEmptyLines = 1
" 启用时修整尾随空格注释
let g:NERDTrimTrailingWhitespace = 1

" YCM 补全

" 随键而全的、支持模糊搜索的、高速补全的插件
" YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发
" 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel term=bold ctermbg=darkred guibg=#13354A


" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 语法高亮多种知名JS库
" 'othree/javascript-libraries-syntax.vim'

let g:used_javascript_libs = 'jquery,react,vue'

" autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
" autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
" autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" 工程文件浏览

" 查看工程文件列表
" 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

" NERDTree: File highlighting 文件列表，文件名字各种颜色高亮
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',   'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md',     'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'magenta', 'none', 'yellow', '#E70350')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html',   'green', 'none', 'green', '#04E703')
call NERDTreeHighlightFile('styl',   'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css',    'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js',     'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 多文档编辑
 
" 显示多个 buffer 对应的 window
" Plug 'fholgado/minibufexpl.vim'
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>
nnoremap <Leader>bn :MBEbn<cr>  " 正向遍历 buffer
nnoremap <Leader>bp :MBEbp<cr>  " 逆向遍历（光标必须在 buffer 列表子窗口外）
nnoremap <Leader>bd :MBEbd<cr>  " 关闭当前buffer（光标必须在 buffer 列表子窗口外）
nnoremap <Leader>bb :b#<cr>     " 你之前所在的前一个 buffer）

" 环境恢复

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>

" 设置快捷键实现一键编译及运行
" nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
" nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" 快速选中结对符内的文本

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" >>>>>>>>>>
" 让你有机会撤销最近一步或多步操作
" 'sjl/gundo.vim'
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>

" 插件syntastic 配置
" 将JavaScript Checker设置为eslint
let g:syntastic_javascript_checkers=['eslint']
" 使用location list 来导航错误列表
let g:syntastic_always_popultate_loc_list=1

" 插件vim-autoformat
" 使用eslint规则进行代码格式化，使用eslint --fix
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
