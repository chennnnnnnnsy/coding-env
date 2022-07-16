vim.api.nvim_create_autocmd("VimEnter", {
  pattern = '*',
  group = 'illuminate_augroup',
  command = 'hi illuminatedWord cterm=undercurl gui=undercurl'
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = 'plugins.lua',
  group = 'packer_user_config',
  command = 'source <afile> | PackerSync'
})
