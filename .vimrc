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
Plug 'morhetz/gruvbox'

plug#end()

# ==============================
# 主题
# ==============================
syntax on
colorscheme gruvbox

# ==============================
# Lsp 设置
# ==============================
set tagfunc=lsp#lsp#TagFunc
var lspOpts = {
  autoHighlightDiags: false,
  autoHighlight: true,
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
          location: '/Users/ex_lincx4/.config/yarn/global/node_modules/@vue/typescript-plugin',
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
nnoremap <C-q> <Cmd>q<CR>
nnoremap <C-s> <Cmd>w<CR>
nnoremap H ^
nnoremap L $
nnoremap P \"+p
nnoremap Y \"+y
vnoremap Y \"+y
vnoremap Y \"+y
nnoremap <leader>n <Cmd>nohl<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap [d <Cmd>LspDiag prev<CR> 
nnoremap ]d <Cmd>LspDiag next<CR> 
nnoremap gr <Cmd>LspPeekReferences<CR>
nnoremap cd <Cmd>LspRename<CR>
nnoremap gd <Cmd>LspGotoDefinition<CR>
nnoremap gD <Cmd>LspGotoDeclaration<CR> 
nnoremap gy <Cmd>LspGotoTypeDef<CR>
nnoremap gI <Cmd>LspGotoImpl<CR>
nnoremap <leader>d <Cmd>close<CR>
# nnoremap <leader>p <Cmd>echo expand('%')<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <leader>lk <Cmd>LspHover<CR>
vnoremap <leader>lk <Cmd>LspHover<CR>
vnoremap <leader>lf <Cmd>LspFormat<CR>
nnoremap <leader>lf <Cmd>LspFormat<CR>
nnoremap <leader>la <Cmd>LspCodeAction<CR>