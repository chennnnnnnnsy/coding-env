local M = {}

M.setup = function(on_attach, capabilities)
  require("neodev").setup({})
  require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  })
end

return M
