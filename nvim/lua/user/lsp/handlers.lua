local M = {}

M.set_config = function()
  vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

  local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn",  text = " " },
    { name = "DiagnosticSignHint",  text = " " },
    { name = "DiagnosticSignInfo",  text = " " }
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name,
      { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = { prefix = "●" },
    -- show signs
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = ""
    }
  }

  vim.diagnostic.config(config)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then return end

-- Custom Capabilities
local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(custom_capabilities)

M.on_attach = function(client, bufnr)
  local bmap = function(type, key, value)
    vim.api.nvim_buf_set_keymap(bufnr, type, key, value,
      { noremap = true, silent = true })
  end

  bmap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bmap("n", "gD", "<cmd>lua vim.lsp.buf.decclarationc()<CR>")
  bmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- bmap("n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>")
  -- bmap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- bmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- bmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
  bmap("n", "g[",
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
  bmap("n", "g]",
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
  -- bmap("n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  -- bmap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

  require('illuminate').on_attach(client)

  -- 用 nvim-lint 来格式化
  local fmt_client = {
    -- "tailwindcss",
    "vuels",
    "tsserver",
    "cssls",
    "cssmodules_ls",
    "eslint",
    "clangd",
    -- "svelte",
    -- "bashls",
    -- "pyright",
    -- "rust_analyzer",
    -- "sumneko_lua",
  }

  for _, vo in ipairs(fmt_client) do
    if client.name == vo then
      client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
      client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    end
  end
end

return M
