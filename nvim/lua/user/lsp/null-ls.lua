local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting

-- solidity 的格式化 https://github.com/prettier-solidity/prettier-plugin-solidity

null_ls.setup({
  sources = {
    formatting.clang_format, -- c/c++
    -- formatting.rustfmt, -- rust
    formatting.prettier.with({extra_filetypes = {'solidity'}}), -- 前端那一套
    formatting.lua_format.with({
      extra_args = {'--indent-width=2', '--tab-width=2', '--no-use-tab'}
    }), -- lua
    formatting.autopep8.with({extra_args = {'-aa'}}), -- python
    null_ls.builtins.code_actions.gitsigns
  }
})
