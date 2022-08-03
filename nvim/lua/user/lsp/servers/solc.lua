local M = {}

-- Snippet to enable the language serve
M.setup = function(on_attach, capabilities)
  require("lspconfig").solc.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {'solcjs', '--lsp'}
  })
end

return M
