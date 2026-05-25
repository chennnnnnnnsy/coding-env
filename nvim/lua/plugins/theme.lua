return {
  -- the colorscheme should be available when starting Neovim
  {
    "Mofiqul/dracula.nvim",  -- 官方 Dracula 主题（Lua 编写，支持 Treesitter/LSP）
    lazy = false,            -- 启动时立即加载（主题必须）
    cond = not is_vscode,
    priority = 1000,         -- 最高优先级加载，避免闪屏
    config = function()
      -- 主题配置（可选，按需调整）
      require("dracula").setup({
        transparent_bg = false,  -- 透明背景（false=默认黑色）
        italic_comment = true,   -- 注释斜体（推荐）
      })
      -- 激活主题
      vim.cmd("colorscheme dracula")  -- 标准深色 | 可选：dracula-soft（柔和版）
    end,
  },
}
