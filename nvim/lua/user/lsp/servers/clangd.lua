local M = {}
--
M.setup = function(on_attach, capabilities)
  capabilities.offsetEncoding = {"utf-16"}
  require("lspconfig").clangd.setup({
    cmd = {"clangd", "--query-driver=/usr/bin/gcc,/usr/bin/g++"},
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
    single_file_support = true,
    on_attach = on_attach,
    capabilities = capabilities
  })
end

return M
