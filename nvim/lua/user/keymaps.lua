-- ======================================================================
-- 注：这是vim的基本快捷键映射。
-- 注：插件的快捷键都放在了 whichkey。
-- 注：<leader> 的快捷键都放在了 whichkey.lua 文件。
-- ======================================================================

local utils = require('user.utils')

-- Remap space as leader key
utils.keymapFn('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- utils.keymapFn('', 's', '<Nop>')
-- utils.keymapFn('', 'S', '<Nop>')
-- utils.keymapFn('', 't', '<Nop>')
-- utils.keymapFn('', 'T', '<Nop>')
-- utils.keymapFn('n', ';', ':')

utils.keymapFn('n', 'H', '^')
utils.keymapFn('n', 'L', '$')

-- save & quit
utils.keymapFn('n', 'W', { 'w' })
utils.keymapFn('n', 'Q', { 'q' })

-- split
utils.keymapFn('n', '<C-s>h', { 'set nosplitright' , 'vsplit' , 'set splitright' })
utils.keymapFn('n', '<C-s>k', { 'set nosplitbelow','split','set splitbelow'})
utils.keymapFn('n', '<C-s>j', {'set splitbelow','split'})
utils.keymapFn('n', '<C-s>l', {'set splitright','vsplit'})

-- copy and patse
utils.keymapFn('n', 'P', '"+p')
utils.keymapFn('v', 'Y', '"+y')

-- search
-- 因为用到了hlslens插件，所以按钮映射有冲突。
-- utils.keymapFn('n', 'n', 'nzz')
-- utils.keymapFn('n', 'N', 'Nzz')

-- resize with arrows
utils.keymapFn("n", "<a-Up>", { 'resize -3' })
utils.keymapFn("n", "<a-Down>", { 'resize +2' })
utils.keymapFn("n", "<a-Left>", { 'vertical resize -2' })
utils.keymapFn("n", "<a-Right>", { 'vertical resize +2' })

-- tab
utils.keymapFn('n', 'tn', { 'tabnew' })
utils.keymapFn('n', 'tc', { 'tabclose' })
utils.keymapFn('n', 'tj', { 'tabnext' })
utils.keymapFn('n', 'tk', { 'tabNext' })

-- buffer
utils.keymapFn('n', '<Tab>', { 'bnext' })
utils.keymapFn('n', '<S-Tab>', { 'bprevious' })
