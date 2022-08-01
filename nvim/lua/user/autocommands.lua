-- packer_user_config
local packer_id = vim.api.nvim_create_augroup('packer_user_config', {clear = false})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  group = packer_id,
  command = "source <afile> | PackerSync"
})

