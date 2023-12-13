require("nvim-dap-virtual-text").setup()
require("dapui").setup()

local dap = require("dap");
local confs = dap.configurations;

-- c/c++
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

local c_config = {
  name = "Launch c",
  type = "gdb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ' .. vim.fn["expand"]('%:p'))
  end,
  cwd = "${workspaceFolder}",
}

local cpp_config = {
  name = "Launch cpp",
  type = "gdb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- return vim.fn.input('Path to executable: ' .. vim.fn["expand"]('%:p'))
  end,
  cwd = "${workspaceFolder}",
}

confs.c = { c_config };
confs.cpp = { cpp_config };
