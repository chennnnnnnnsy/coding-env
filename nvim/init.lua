rocks = {}
local is_vscode = vim.g.vscode == 1;

require("config.options")
require("config.keymaps")

if is_vscode then
  require("vsc.init")
  vim.notify("vscode配置加载成功！")
end

require("config.lazy")