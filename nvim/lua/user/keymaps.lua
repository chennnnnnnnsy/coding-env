-- ======================================================================
-- 注：这是vim的基本快捷键映射。
-- 注：插件的快捷键都放在了 whichkey。
-- 注：<leader> 的快捷键都放在了 whichkey.lua 文件。
-- ======================================================================
local opts = {noremap = true, silent = true}
local opt_n = {noremap = true}

-- Shorten function name
local key = vim.api.nvim_set_keymap
local cmd = function(val) return '<cmd>' .. val .. '<cr>' end

-- Remap space as leader key
key('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

key('', 's', '<Nop>', opts)
key('n', ';', ':', opt_n)
key('i', 'jk', '<Esc><Esc>', opt_n)

-- save & quit
key('n', 'W', cmd('w'), opts)
key('n', 'Q', cmd('q'), opts)

-- split
key('n', 'sh', cmd('set nosplitright') .. cmd('vsplit') .. cmd('set splitright'), opts)
key('n', 'sk', cmd('set nosplitbelow') .. cmd('split') .. cmd('set splitbelow'), opts)
key('n', 'sj', cmd('set splitbelow') .. cmd('split'), opts)
key('n', 'sl', cmd('set splitright') .. cmd('vsplit'), opts)

-- copy and patse
key('n', 'P', '"+p', opts)
key('v', 'Y', '"+y', opts)

-- search
-- 因为用到了hlslens插件，所以按钮映射有冲突。
-- key('n', 'n', 'nzz', opts)
-- key('n', 'N', 'Nzz', opts)

-- resize with arrows
key("n", "<a-Up>", cmd('resize -3'), opts)
key("n", "<a-Down>", cmd('resize +2'), opts)
key("n", "<a-Left>", cmd('vertical resize -2'), opts)
key("n", "<a-Right>", cmd('vertical resize +2'), opts)

-- tab
key('n', 'tn', cmd('tabnew'), opts)
key('n', 'to', cmd('tabo'), opts)
key('n', 'tc', cmd('tabc'), opts)

-- buffer
key('n', '<Tab>', cmd('bnext'), opts)
key('n', '<S-Tab>', cmd('bprevious'), opts)
