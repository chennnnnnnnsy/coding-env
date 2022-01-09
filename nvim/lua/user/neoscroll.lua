local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then return end

neoscroll.setup({mappings = {'<C-u>', '<C-d>', 'zz'}, use_local_scrolloff = true})
