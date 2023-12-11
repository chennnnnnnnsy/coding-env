local fn = vim.fn
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Automatically install packer
if fn.empty(fn.glob(lazypath)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })

  print('Installing lazy.nvim close and reopen Neovim...')
end
vim.opt.rtp:prepend(lazypath);

require("lazy").setup({
  "nvim-lua/popup.nvim", -- neovim的弹窗接口实现,telescope用到
  "nvim-lua/plenary.nvim", -- 一个lua的工具库，含各种lua的封装好的实用函数。
  "lewis6991/impatient.nvim", -- 加快打开nvim速度，因为用到了缓存
  "folke/neodev.nvim", -- lua 的开发用到的函数签名，代码补全。lua语言服务器的插件.

  "goolord/alpha-nvim", -- 打开的欢迎页

  -- use({'dracula/vim', as = "dracula"}) -- 德古拉主题
  -- use('RRethy/nvim-base16') -- 主题
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }, --主题

  -- neovim 的界面美化
  {"kyazdani42/nvim-web-devicons", lazy = true}, -- 文件图标
   "nvim-lualine/lualine.nvim",
   "akinsho/bufferline.nvim", -- 顶部buffer状态行
   "nvim-tree/nvim-tree.lua", -- 文件管理器，就是侧边菜单 TODO: 有了telescope-file-browser.nvim, 还要不要这个呢
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- 优美地显示tab和缩进

  -- 杂项
  "karb94/neoscroll.nvim", -- 德芙般丝滑滚动
  {"folke/which-key.nvim", lazy = true}, -- 查看快捷键
  "akinsho/toggleterm.nvim", -- 终端集成器

  -- 文本编辑用到的
  "kevinhwang91/nvim-hlslens", -- 搜索的结果可以知道有多少个
  "RRethy/vim-illuminate", -- 光标所在词，在全文都高亮
  "mg979/vim-visual-multi", -- 多光标
  -- "gcmt/wildfire.vim", -- 回车可以选择闭合标签里面的内容 TODO: 可以换成 wildfire.nvim
  "windwp/nvim-autopairs", -- 自动添加括号、中括号等。与 nvim-cmp , treesitter 集成.
  "windwp/nvim-ts-autotag", -- 自动添加闭合标签，常用于前端.
  { "folke/flash.nvim", event = "VeryLazy" },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy"},

  -- 代码注释插件
  "numToStr/Comment.nvim", -- 代码注释
  "AmeerTaweel/todo.nvim", -- todo 注释会高亮，而且可以搜索
  "JoosepAlviste/nvim-ts-context-commentstring",-- 根据treesitter检查当前光标所在行的文本类型，进行注释。注：与Comment.nvim 配合使用.
  {"heavenshell/vim-jsdoc", build = 'make install', ft = {'javascript', 'javascript.jsx','typescript'}},

  -- 补全插件
  "hrsh7th/cmp-nvim-lsp", -- cmp的source: lsp的补全。
  "hrsh7th/cmp-buffer", -- cmp的source: buffer words 补全
  "hrsh7th/cmp-path", -- cmp的source: 文件系统路径补全
  "hrsh7th/cmp-cmdline", -- cmp的source: vim 命令行命令补全
  "hrsh7th/nvim-cmp", -- 补全引擎，需要另外添加source
  "lukas-reineke/cmp-under-comparator", -- 提示的补全更好地排序
  "saadparwaiz1/cmp_luasnip", -- 把LuaSnip加载的代码片段生成source.

  -- 代码片段插件
  "rafamadriz/friendly-snippets", -- 代码片段集合, 用LuaSnip加载它们
  "L3MON4D3/LuaSnip", --  用来加载代码片段

  -- LSP插件
  "neovim/nvim-lspconfig", -- nvim的LSP配置,用来启动LSP。社区版本。
  "mfussenegger/nvim-lint", -- 只要用来format. 基于lsp的format插件

  -- 模糊搜索插件
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}, -- 模糊搜索的插件，高性能排序
  "ahmedkhalf/project.nvim", -- 与telescope集成，搜索项目
  { "crispgm/telescope-heading.nvim",
    ft = "markdown",
    config = function() require("telescope").load_extension("heading") end
  }, -- 用在makrdown文件上，标题搜索.
  "nvim-telescope/telescope.nvim", -- 模糊搜索，如搜索文件等。
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5' },
  "nvim-telescope/telescope-file-browser.nvim", -- file browser

  -- 语法高亮插件
  {"nvim-treesitter/nvim-treesitter", cmd = "TSUpdate"}, -- 基于的tree-sitter的语法高亮
  "p00f/nvim-ts-rainbow", -- 彩虹括号，问你爱不爱。注：nvim-treesitter的插件

  "lewis6991/gitsigns.nvim", -- git集成器。

  -- Debug 工具
  -- use('mfussenegger/nvim-dap')
  -- use('rcarriga/nvim-dap-ui')
  -- use('theHamsta/nvim-dap-virtual-text')
})


