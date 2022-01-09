local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}

-- set configure fn. eg: opt('w', 'number', true)
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- ===== start here =====
opt('b', 'expandtab', true) -- 用spaces代替tabs
opt('b', 'shiftwidth', 2) -- 每个缩进都插入x个空格
opt('b', 'tabstop', 2) -- 用x个空格代替1个tab
opt('b', 'softtabstop', 2) -- 用x个空格代替1个tab
opt('o', 'showtabline', 2) -- 总是显示tab

opt('w', 'wrap', false) -- 不换行
-- opt('w', 'colorcolumn', 100)		  -- 一行多少字符，换行

opt('w', 'number', true) -- 显示行号
opt('w', 'relativenumber', true) -- 显示光标所在行的相对行号
opt('w', 'cursorline', true) -- 光标所在行高亮

opt('w', 'foldmethod', 'indent') -- 根据表达式进行折叠
opt('o', 'foldlevel', 99) -- 折叠层级可以去到x层

opt('o', 'mouse', 'n') -- 只有在normal模式才显示鼠标
opt('o', 'undofile', true)
opt('o', 'writebackup', false)
opt('o', 'backup', false)
opt('o', 'signcolumn', 'yes') -- 总是显示标记列,即是最左边。
opt('o', 'pumheight', 10) -- 弹窗层高
opt('o', 'fileencoding', 'utf-8') -- 文本编码
opt('o', 'showmode', false) -- 不显示模式
opt('o', 'conceallevel', 0) -- 为了markdown能显示``
opt('o', 'hidden', true) -- 切换buffer时不保存它们
opt('o', 'lazyredraw', true) -- 使宏命令更快响应
opt('o', 'timeoutlen', 1000) -- mappings等待时间。注：这个值会影响 which-key 插件的响应时间。
opt('o', 'ttimeoutlen', 100) -- mappings等待时间
opt('o', 'cmdheight', 2) -- 命令行有更多空间显示信息
opt('o', 'guifont', 'Roboto Mono Medium for Powerline Font:h18')

opt('o', 'completeopt', "menu,menuone,noselect") -- 代码补全配置
opt('o', 'updatetime', 300) -- 更快的补全时间

opt('o', 'autoindent', true) -- 跟着上一行来缩进
opt('o', 'smartindent', true) -- 智能缩进

opt('o', 'ignorecase', true) -- 搜索时，忽略大小写
opt('o', 'smartcase', true) -- 搜索时，智能检测大小写
opt('o', 'incsearch', true) -- 搜索时，不自动去到第一个搜索到的。
opt('o', 'hlsearch', true) -- 搜索时，搜索词高亮

opt('o', 'scrolloff', 8) -- 滚动到底部时留着x行
opt('o', 'sidescrolloff', 8) -- 滚动到最右边时留着x行

opt('o', 'splitright', true) -- 左右分割屏幕都在右边
opt('o', 'splitbelow', true) -- 上下分割屏幕都在下面

opt('o', 'list', true) -- 显示隐藏的字符
opt('o', 'listchars', 'tab:··,trail:▫') -- 隐藏的字符对应显示什么字符

opt('o', 'termguicolors', true) -- 显示真彩颜色

vim.o.shortmess = vim.o.shortmess .. 'c' -- vim的一些消息显示是否缩写，c 就是不缩写.

-- 选项 formatoptions 确定了跟文本格式化有关的基本选项，常用的数值有：
-- t：根据 textwidth 自动折行；
-- c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符；
-- r：插入模式下在注释中键入回车时，插入合适的注释起始字符；
-- q：允许使用“gq”命令对注释进行格式化；
-- n：识别编号列表，编号行的下一行的缩进由数字后的空白决定（与“2”冲突，需要“autoindent”）；
-- 2：使用一段的第二行的缩进来格式化文本；
-- l：在当前行长度超过 textwidth 时，不自动重新格式化；
-- m：在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）；
-- M：在拼接两行时（重新格式化，或者是手工使用“J”命令），如果前一行的结尾或后一行的开头是多字节字符，则不插入空格，非常适合中文
vim.o.formatoptions = vim.o.formatoptions:gsub("r", ""):gsub("o", "")

vim.cmd([[set dir=~/.config/nvim/tmp]])
vim.cmd('syntax on')
