local path = 'user.'

require(path .. 'basic')
require(path .. 'keymaps')
require(path .. 'plugins')
require(path .. 'theme')

-- plugin configure
require(path .. 'alpha')
require(path .. 'statusline')
require(path .. 'bufferline')
require(path .. 'nvimtree')
require(path .. 'hlslens')
require(path .. 'toggleterm')
require(path .. 'neoscroll')
require(path .. 'comment')
require(path .. 'treesitter')
require(path .. 'autopairs')
require(path .. 'sandwich')
require(path .. 'cmp')
require(path .. 'project')
require(path .. 'telescope')
require(path .. 'gitsigns')
require(path .. 'lsp.init')
require(path .. 'autocommands')

require(path .. 'whichkey')
-- TODO 启动页有缩进线，有去掉。

