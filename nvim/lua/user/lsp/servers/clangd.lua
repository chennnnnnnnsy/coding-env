local M = {}

M.setup = function(on_attach, capabilities)
  capabilities.offsetEncoding = { "utf-16" }
  require("lspconfig").clangd.setup({
    cmd={ "clangd", "--query-driver=/usr/bin/gcc,/usr/bin/g++"},
    init_options = {clangdFileStatus = true},
    on_attach = on_attach,
    capabilities = capabilities
  })
end

return M
