local util = require "formatter.util"

local function prettierFn()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", util.escape_path(util.get_current_buffer_file_path())},
    stdin = true,
    try_node_modules = true
  }
end

local function cAndCppFn()
  return {
    exe = "clang-format",
    args = {"-assume-filename", util.escape_path(util.get_current_buffer_file_name())},
    stdin = true,
    try_node_modules = true
  }
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = false,
  -- Set the log level
  -- log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      function()
        return {
          exe = "lua-format",
          args = {
            '--indent-width=2', '--tab-width=2', '--no-use-tab',
            util.escape_path(util.get_current_buffer_file_path())
          },
          stdin = true
        }
      end
    },
    c = {cAndCppFn},
    cpp = {cAndCppFn},
    html = {prettierFn},
    javascript = {prettierFn},
    javascriptreact = {prettierFn},
    typescript = {prettierFn},
    typescriptreact = {prettierFn},
    css = {prettierFn},
    json = {prettierFn},
    markdown = {prettierFn},
    vue = {prettierFn},

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
