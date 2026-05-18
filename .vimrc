vim9script

# ==============================
# 基础设置
# ==============================
&number = v:true
&relativenumber = v:true
&tabstop = 2
&shiftwidth = 2
&expandtab = v:true
&smartindent = v:true
&autoindent = v:true
&ignorecase = v:false          # 对应 set noignorecase
&incsearch = v:true
&hlsearch = v:true
&wildmenu = v:true
&wildmode = 'list:longest,full'
&path ..= ',**'
&lazyredraw = v:true
&synmaxcol = 200

# ==============================
# Netrw 设置
# ==============================
g:netrw_banner = 0
g:netrw_liststyle = 3


