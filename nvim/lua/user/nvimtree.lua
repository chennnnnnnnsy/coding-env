local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then return end

-- 参考文档 https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- user mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v',  api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'a',  api.fs.create, opts('Create'))
end

nvim_tree.setup {
  disable_netrw = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  git = {enable = true, ignore = true, timeout = 500},
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false
  },
  trash = {cmd = "trash", require_confirm = true},
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌"
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = ""
        }
      }
    }
  },
  actions = {remove_file = {close_window = true}},
  -- on_attach = my_on_attach,
}
