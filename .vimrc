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

syntax off

# ==============================
# Netrw 设置
# ==============================
g:netrw_banner = 0
g:netrw_liststyle = 3

# ==============================
# vim-plug 设置
# ==============================
plug#begin()

Plug 'yegappan/lsp'

plug#end()

# ==============================
# Lsp 设置
# ==============================
set tagfunc=lsp#lsp#TagFunc
var lspOpts = {
  autoHighlightDiags: false,
  autoHighlight: false,
  showSignature: false,
  noNewlineInCompletion: true,
  showInlayHints: true,
}

var lspServers = [
  {
    name: 'tsserver',
    filetype: ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'vue'],
    path: '/opt/homebrew/bin/typescript-language-server',
    args: ['--stdio'],
    initializationOptions: {
      plugins: [
        {
          name: '@vue/typescript-plugin',
          location: '~/.config/yarn/global/node_modules/@vue/language-server',
          languages: ['vue'],
        }
      ]
    }
  },
  {
    name: 'vue_ls',
    filetype: ['vue'],
    path: '/opt/homebrew/bin/vue-language-server',
    args: ['--stdio'],
  }
]

augroup lsp_group
  autocmd!
  autocmd User LspSetup call LspOptionsSet(lspOpts)
  autocmd User LspSetup call LspAddServer(lspServers)

  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
augroup END

# ==============================
# 快捷键设置
# ==============================
g:mapleader = ' '
nnoremap s <Nop>
nnoremap Q <cmd>q<CR>
nnoremap W <cmd>q<CR>
nnoremap H ^
nnoremap L $
nnoremap P \"+p
nnoremap Y \"+y
vnoremap P \"+p
vnoremap Y \"+y
nnoremap <leader>n <Cmd>nohl<CR>
nnoremap g[ <Cmd>LspDiag prev<CR> # 上一个诊断
nnoremap g] <Cmd>LspDiag next<CR> # 下一个诊断
nnoremap gr <Cmd>LspPeekReferences<CR> # 查看引用
nnoremap gR <Cmd>LspRename<CR> # 重命名
nnoremap gd <Cmd>LspGotoDefinition<CR> # 跳转到定义
nnoremap gD <Cmd>LspGotoTypeDef<CR> # 跳转到类型定义
nnoremap gi <Cmd>LspGotoImpl<CR> # 跳转到实现
nnoremap gI <Cmd>LspGotoDeclaration<CR> # 跳转到声明
nnoremap <leader>d <Cmd>close<CR> # 关闭当前窗口
nnoremap <leader>p <Cmd>echo expand('%')<CR> # 打印当前文件路径
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" # 补全
nnoremap <leader>lk <Cmd>LspHover<CR> # 显示悬浮提示
vnoremap <leader>lk <Cmd>LspHover<CR> # 显示悬浮提示
vnoremap <leader>lf <Cmd>LspFormat<CR> # 格式化
nnoremap <leader>lf <Cmd>LspFormat<CR> # 格式化
nnoremap <leader>la <Cmd>LspCodeAction<CR> # 代码动作
