local dap = require("dap");
local confs = dap.configurations;

-- gdb adapter
dap.adapters.gdb = {type = "executable", command = "gdb", args = {"-i", "dap"}}

-- lldb-vscode adapter
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/local/opt/llvm/bin/lldb-vscode",
  name = 'lldb'
}

-- c config
local c_config = {
  name = "Launch c",
  type = "gdb",
  request = "launch",
  program = function() return vim.fn.input('Path to executable: ' .. vim.fn["expand"]('%:p')) end,
  cwd = "${workspaceFolder}"
}

-- cpp config
local cpp_config = {
  name = "Launch cpp",
  type = "lldb",
  request = "launch",
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- return vim.fn.input('Path to executable: ' .. vim.fn["expand"]('%:p'))
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
  args = {}
}

confs.c = {c_config};
confs.cpp = {cpp_config};

-- nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup {
  enabled = true, -- enable this plugin (the default)
  enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true, -- show stop reason when stopped for exceptions
  commented = false, -- prefix virtual text with comment string
  only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
  all_references = false, -- show virtual text on all all references of the variable (not only definitions)
  clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
  --- A callback that determines how a variable is displayed or whether it should be omitted
  --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
  --- @param buf number
  --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
  --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
  --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
  --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == 'inline' then
      return ' = ' .. variable.value
    else
      return variable.name .. ' = ' .. variable.value
    end
  end,
  -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
  virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

  -- experimental features:
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

-- 美化
local dap_breakpoint_color = {
  breakpoint = {ctermbg = 0, fg = '#993939', bg = '#31353f'},
  logpoing = {ctermbg = 0, fg = '#61afef', bg = '#31353f'},
  stopped = {ctermbg = 0, fg = '#98c379', bg = '#31353f'}
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
  error = {
    text = "",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint"
  },
  condition = {
    text = 'ﳁ',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  },
  rejected = {
    text = "",
    texthl = "DapBreakpint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint"
  },
  logpoint = {text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint'},
  stopped = {text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped'}
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

require('dapui').setup({
  expand_lines = true,
  icons = {expanded = "", collapsed = "", circular = ""},
  mappings = {
    -- Use a table to apply multiple mappings
    expand = {"<CR>", "<2-LeftMouse>"},
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t"
  },
  layouts = {
    {
      elements = {
        {id = "scopes", size = 0.33}, {id = "breakpoints", size = 0.17},
        {id = "stacks", size = 0.25}, {id = "watches", size = 0.25}
      },
      size = 0.33,
      position = "right"
    }, {
      elements = {{id = "repl", size = 0.45}, {id = "console", size = 0.55}},
      size = 0.27,
      position = "bottom"
    }
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {close = {"q", "<Esc>"}}
  }
});
