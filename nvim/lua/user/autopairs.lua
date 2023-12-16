local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then return end

-- 与treesitter集成
npairs.setup {
  check_ts = true,
  ts_config = {lua = {"string"}, javascript = {"template_string"}, java = false},
  disable_filetype = {"TelescopePrompt", "spectre_panel"}
}

-- 集成nvim-cmp
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then return end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require('nvim-ts-autotag').setup()

