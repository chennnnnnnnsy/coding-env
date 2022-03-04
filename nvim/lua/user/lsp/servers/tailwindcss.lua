local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").tailwindcss.setup({
    filetypes = {
      "html","svelte", "jade", "markdown", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss"
    },
    on_attach = on_attach,
    capabilities = capabilities
  })
end

return M
