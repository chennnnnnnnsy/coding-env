local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

local handles = require('user/lsp/handlers')

handles.set_config()

local server_list = {
  "vuels", "tsserver", "lua_ls", "clangd", "eslint", "cssls", "cssmodules_ls"
  -- "pyright",
  -- "svelte",
  -- "tailwindcss",
  -- "solc"
  -- "rust_analyzer",
  -- "bashls",
}

for _, server in ipairs(server_list) do
  require("user/lsp/servers/" .. server).setup(handles.on_attach, handles.capabilities)
end
