local fn = vim.fn
local install_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
  local origin_github_path = 'https://github.com/wbthomason/packer.nvim'
  local speed_github_path =
      'https://github.com.cnpmjs.org/wbthomason/packer.nvim.git'
  PACKER_BOOTSTRAP = fn.system({
    'git', 'clone', '--depth', '1', origin_github_path, -- speed_github_path,
    install_path
  })

  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Load packer. if error , it will be return.
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({border = "single"}) -- 弹窗，设置边框
    end
  }
  -- 国内访问github总是443，只能配置以下
  -- git = {default_url_format = 'https://github.com.cnpmjs.org/%s.git'}
})

-- Install plugins
return packer.startup(function(use)
  use('wbthomason/packer.nvim') -- 安装自身都可以

  use("nvim-lua/popup.nvim") -- neovim的弹窗接口实现,telescope用到
  use("nvim-lua/plenary.nvim") -- 一个lua的工具库，含各种lua的封装好的实用函数。
  use("lewis6991/impatient.nvim") -- 加快打开nvim速度，因为用到了缓存

  use("goolord/alpha-nvim") -- 打开的欢迎页

  use({'dracula/vim', as = "dracula"}) -- 德古拉主题
  use('RRethy/nvim-base16') -- 主题

  -- neovim 的界面美化
  use("kyazdani42/nvim-web-devicons") -- 文件图标
  use({
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }) -- 状态行
  use({'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}) -- 顶部buffer状态行
  use({'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}) -- 文件管理器，就是侧边菜单
  use("lukas-reineke/indent-blankline.nvim") -- 优美地显示tab和缩进

  -- 杂项
  use('karb94/neoscroll.nvim') -- 德芙般丝滑滚动
  use("folke/which-key.nvim") -- 查看快捷键
  use("akinsho/toggleterm.nvim") -- 终端集成器

  -- 文本编辑用到的
  use("kevinhwang91/nvim-hlslens") -- 搜索的结果可以知道有多少个
  use('famiu/bufdelete.nvim') -- 优雅地删除buffer
  use("RRethy/vim-illuminate") -- 光标所在词，在全文都高亮
  use("machakann/vim-sandwich") -- 加入、替换、删除一些单引号、双引号、括号等
  use({'mg979/vim-visual-multi', branch = "master"}) -- 多光标
  use('gcmt/wildfire.vim') -- 回车可以选择闭合标签里面的内容

  use("windwp/nvim-autopairs") -- 自动添加括号、中括号等。与 nvim-cmp , treesitter 集成.
  use("windwp/nvim-ts-autotag") -- 自动添加闭合标签，常用于前端.

  -- 代码注释插件
  use('numToStr/Comment.nvim') -- 代码注释
  use("AmeerTaweel/todo.nvim") -- todo 注释会高亮，而且可以搜索
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- 根据treesitter检查当前光标所在行的文本类型，进行注释。注：与Comment.nvim 配合使用.

  -- 补全插件
  use('hrsh7th/cmp-nvim-lsp') -- cmp的source: lsp的补全。
  use('hrsh7th/cmp-buffer') -- cmp的source: buffer words 补全
  use('hrsh7th/cmp-path') -- cmp的source: 文件系统路径补全
  use('hrsh7th/cmp-cmdline') -- cmp的source: vim 命令行命令补全
  use('hrsh7th/nvim-cmp') -- 补全引擎，需要另外添加source
  use("lukas-reineke/cmp-under-comparator") -- 提示的补全更好地排序
  use("saadparwaiz1/cmp_luasnip") -- 把LuaSnip加载的代码片段生成source.

  -- 代码片段插件
  use("rafamadriz/friendly-snippets") -- 代码片段集合, 用LuaSnip加载它们
  use("L3MON4D3/LuaSnip") --  用来加载代码片段

  -- LSP插件
  use('neovim/nvim-lspconfig') -- nvim的LSP配置,用来启动LSP。社区版本。
  use("jose-elias-alvarez/null-ls.nvim") -- 只要用来format. 基于lsp的format插件
  use('folke/lua-dev.nvim') -- lua 的开发用到的函数签名，代码补全。lua语言服务器的插件.

  -- 模糊搜索插件
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}) -- 模糊搜索的插件，高性能排序
  use("ahmedkhalf/project.nvim") -- 与telescope集成，搜索项目
  use({
    "crispgm/telescope-heading.nvim",
    ft = "markdown",
    config = function() require("telescope").load_extension("heading") end
  }) -- 用在makrdown文件上，标题搜索.
  use("nvim-telescope/telescope.nvim") -- 模糊搜索，如搜索文件等。

  -- 语法高亮插件
  use ("napmn/react-extract.nvim") -- treesitter 中没有支持react，这个格外的扩展可以支持reat。
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- 基于的tree-sitter的语法高亮
  use({"p00f/nvim-ts-rainbow"}) -- 彩虹括号，问你爱不爱。注：nvim-treesitter的插件

  use("lewis6991/gitsigns.nvim") -- git集成器。

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
