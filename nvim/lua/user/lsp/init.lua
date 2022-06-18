local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require('user/lsp/null-ls')
local handles = require('user/lsp/handlers')

handles.set_config()

local server_list = {
  "tailwindcss", "svelte", "vuels", "tsserver", "bashls", "sumneko_lua",
  "clangd", "eslint", "cssls", "cssmodules_ls"
  -- "pyright", "rust_analyzer",
}

for _, server in ipairs(server_list) do
  require("user/lsp/servers/" .. server).setup(handles.on_attach,
                                               handles.capabilities)
end
