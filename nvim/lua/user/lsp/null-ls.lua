local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.clang_format, -- c/c++
    formatting.rustfmt, -- rust
    formatting.prettier, -- 前端那一套
    formatting.lua_format.with({
      extra_args = {'--indent-width=2', '--tab-width=2', '--no-use-tab'}
    }), -- lua
    null_ls.builtins.code_actions.gitsigns
  }
  -- 保存就格式化
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --       vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --   end
  -- end,
})

