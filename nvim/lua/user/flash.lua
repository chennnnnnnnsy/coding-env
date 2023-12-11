require("flash").setup({
  modes = {
    search = {
      enabled = false,
    },
    char = {
      enabled = false,
      -- by default all keymaps are enabled, but you can disable some of them,
      -- by removing them from the list.
      -- If you rather use another key, you can map them
      -- to something else, e.g., { [";"] = "L", [","] = H }
      -- keys = { "f", "F", "t", "T", ";", "," },
      -- keys = { ["f"] = "F", ";", ","},
    }
  }
})

-- 快捷键
local opt_n = {noremap = true}
local key = vim.api.nvim_set_keymap
local defaultPre = "lua require('flash')."
local cmd = function(val) return '<cmd>'.. defaultPre .. val .. '()' .. '<cr>' end

key('n','f', cmd('jump'), opt_n)
key('x','f', cmd('jump'), opt_n)
key('o','f', cmd('jump'), opt_n)

key('n','t', cmd('treesitter'), opt_n)
key('x','t', cmd('treesitter'), opt_n)
key('o','t', cmd('treesitter'), opt_n)

key('o','r', cmd('remote'), opt_n)

key('o','R', cmd('treesitter_search'), opt_n)
key('x','R', cmd('treesitter_search'), opt_n)

