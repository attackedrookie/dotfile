" 设置不兼容模式，推荐设置
set nocompatible

" 设置 runtimepath，用于查找插件等
set runtimepath+=~/.vim/autoload

" 开始 vim-plug 配置块
call plug#begin('~/.vim/plugged')

" 插件列表
Plug 'preservim/NERDTree'       " 文件目录树
Plug 'dense-analysis/ale'        " 语法动态检查
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码补全
Plug 'vim-airline/vim-airline'   " 状态栏美化
Plug 'vim-airline/vim-airline-themes' " 状态栏主题
Plug 'RRethy/vim-illuminate' " 选择高亮插件
Plug 'scalameta/coc-metals' " Coc 拓展配置

call plug#end() " vim-plug 配置块结束


" 插件加载完成后执行的配置
filetype plugin indent on    " 开启文件类型插件和缩进
syntax on                    " 开启语法高亮

" 基本设置
set background=dark
set showcmd              " 显示 (部分) 命令在状态行
set showmatch            " 显示匹配的括号
set ignorecase           " 忽略大小写匹配
set smartcase            " 智能大小写匹配
set incsearch            " 增量搜索
set hidden               " 隐藏已放弃的缓冲区
set mouse=a              " 启用鼠标 (所有模式)
setlocal noswapfile      " 不要生成 swap 文件
set bufhidden=hide       " 当 buffer 被丢弃时隐藏它
colorscheme evening      " 配色方案
set number               " 显示行号
set cursorline           " 突出显示当前行
set ruler                " 打开状态栏标尺
set shiftwidth=4         " 设定 << 和 >> 命令移动时的宽度
set tabstop=4            " 设定 tab 长度
set expandtab            " 将 Tab 转换为空格
set autoindent           " 自动缩进
set smartindent          " 智能缩进
set nobackup             " 覆盖文件时不备份
set autochdir            " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes       " 设置备份行为为覆盖
set hlsearch             " 搜索时高亮显示
set t_vb=                " 置空错误铃声的终端代码
set matchtime=2          " 匹配括号高亮时间
set magic                " 设置魔术
set backspace=indent,eol,start " 设置退格键行为
set cmdheight=1          " 设定命令行行数
set laststatus=2         " 显示状态栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置状态行信息
set foldenable           " 启用折叠
set foldmethod=syntax     " 设置语法折叠
set foldcolumn=0         " 设置折叠列宽
setlocal foldlevel=1     " 设置折叠层级
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 空格键切换折叠

" NERDTree 配置
map <C-n> :NERDTreeToggle<CR> " Corrected: Removed extra ')'

function! Check_back_space() abort " 检查光标前是否为空格
    let col = col('.') - 1
    return col <= 1 || getline('.')[col - 1] =~# '\s'
endfunction

" coc.nvim 配置
let g:coc_global_extensions = ['coc-clangd'] " 安装扩展，放在所有 coc 配置之前
" 一些常用映射
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<CR>" " 回车键选择补全项或换行
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ Check_back_space() ? "\<TAB>" :
    \ coc#refresh() " Tab 键智能补全
inoremap <silent><expr> <c-space> coc#refresh() " Ctrl+空格手动触发补全
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" " Shift+Tab 上移或退格

" 定义跳转和查找引用
nmap <silent> gd <Plug>(coc-definition)    " 跳转到定义
nmap <silent> gy <Plug>(coc-type-definition) " 跳转到类型定义
nmap <silent> gi <Plug>(coc-implementation) " 跳转到实现
nmap <silent> gr <Plug>(coc-references)    " 查找引用
nmap <silent> <leader>rn <Plug>(coc-rename)    " 重命名

set signcolumn=yes " 设置诊断信息显示方式

" ale 配置
let g:ale_linters = {'c': ['gcc', 'clang']}
let g:ale_fixers = {'c': ['clang-format']}
let g:ale_fix_on_save = 1
let g:ale_linters = {'verilog': ['iverilog']}
let g:ale_verilog_iverilog_options = '-g2012'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'

" illuminate 配置
let g:Illuminate_delay = 200 " 设置高亮延迟 (毫秒)
let g:Illuminate_ft_ignore = ['nerdtree'] " 忽略某些文件类型

" 全局配置文件 (放在最后，避免影响其他配置)
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map ='<c-p>'
let g:ctrlp_cmd = 'CtrlP'


