local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").pyright.setup({
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
    on_attach = on_attach,
    capabilities = capabilities
  })
end

return M
