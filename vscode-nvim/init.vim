if empty(glob('D:\MyData\ex_lincx3\AppData\Local\nvim\autoload\plug.vim'))
   silent !curl -fLo D:\MyData\ex_lincx3\AppData\Local\nvim\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 基础属性置
set expandtab " 用spaces代替tabs
set shiftwidth=2 " 个缩进都插入x个空格
set tabstop=2 " x个空格代替1个tab
set softtabstop=2 " x个空格代替1个tab
set showtabline=2 " 显示tab
set nowrap " 换行
set number " 示行号
set relativenumber " 显示光标所在行的相对行号
set cursorline " 光标所在行高亮
set foldmethod=indent " 根据表达式进行折叠
set foldlevel=99 " 叠层级可以去到x层
set mouse=n " 有在normal模式才显示鼠标
set undofile
set nowritebackup
set nobackup
set signcolumn=yes " 总是显示标记列,即是最左边。
set pumheight=10 " 窗层高
set fileencoding=utf-8 " 文本编码
set noshowmode " 不显示模式
set conceallevel=0 " 为了markdown能显示``
set nohidden " 换buffer时不保存它们
set lazyredraw " 使宏命令更快响应
set timeoutlen=1000 " appings等待时间。注：这个值会影响 which-key 插件的响应时间。
set ttimeoutlen=100 " appings等待时间
set cmdheight=2 " 令行有更多空间显示信息
set completeopt=menu,menuone,noselect " 代码补全配置
set updatetime=300 " 更快的补全时间
set autoindent  " 跟着上一行来缩进
set smartindent " 智能缩进
set ignorecase " 搜索时，忽略大小写
set smartcase " 搜索时，智能检测大小写
set incsearch " 搜索时，不自动去到第一个搜索到的。
set hlsearch " 索时，搜索词高亮
set scrolloff=8 " 动到底部时留着x行
set sidescrolloff=8 " 滚动到最右边时留着x行
set splitright " 左右分割屏幕都在右边
set splitbelow " 上下分割屏幕都在下面
set list " 示隐藏的字符
set listchars=tab:··,trail:▫ " 隐藏的字符对应显示什么字符

" 插件
call plug#begin('D:\MyData\ex_lincx3\AppData\Local\nvim\autoload')
  Plug 'machakann/vim-sandwich'
  Plug 'gcmt/wildfire.vim'
call plug#end()

" 快捷键映射
let mapleader=" "
let maplocalleader=" "

noremap <silent> s <Nop>
nnoremap ; :
nnoremap <silent> W <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <silent> Q <Cmd>call VSCodeNotify('workbench.action.quit')<CR>
nnoremap sl :vsplit<CR>
nnoremap <silent> P "+p
vnoremap <silent> Y "+y
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> <Tab> <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
nnoremap <silent> <S-Tab> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <LEADER>n :noh<CR>
nnoremap <LEADER>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <LEADER>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <LEADER>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <LEADER>fm <Cmd>call VSCodeNotify('todo-tree-view.focus')<CR>
nnoremap <LEADER>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <LEADER>lk <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <LEADER>lf <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>
nnoremap <LEADER>lt <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap <LEADER>ld <Cmd>call VSCodeNotify('workbench.panel.markers.view.focus')<CR>
nnoremap <LEADER>lq <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nnoremap <LEADER>gd <Cmd>call VSCodeNotify('git.timeline.openDiff')<CR>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
