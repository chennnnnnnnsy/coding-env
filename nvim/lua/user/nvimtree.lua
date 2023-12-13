local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

-- Show the mappings: g?

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim_tree.setup {
--   disable_netrw = true,
--   update_cwd = true,
--   diagnostics = {
--     enable = true,
--     icons = {hint = "", info = "", warning = "", error = ""}
--   },
--   update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
--   git = {enable = true, ignore = true, timeout = 500},
--   view = {
--     width = 30,
--     side = "left",
--     number = false,
--     relativenumber = false
--   },
--   trash = {cmd = "trash", require_confirm = true},
--   renderer = {
--     icons = {
--       glyphs = {
--         default = "",
--         symlink = "",
--         git = {
--           unstaged = "",
--           staged = "S",
--           unmerged = "",
--           renamed = "➜",
--           deleted = "",
--           untracked = "U",
--           ignored = "◌"
--         },
--         folder = {
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = ""
--         }
--       }
--     }
--   },
--   actions = {remove_file = {close_window = true}},
-- }
