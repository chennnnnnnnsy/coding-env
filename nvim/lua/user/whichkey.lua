local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

local cmd = function(val) return '<cmd>' .. val .. '<cr>' end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20 -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g
    }
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+" -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>' -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
    padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = {min = 4, max = 25}, -- min and max height of the columns
    width = {min = 20, max = 50}, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left" -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = {"j", "k"},
    v = {"j", "k"}
  }
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
  ['n'] = {':noh<cr>', 'No Highlight'},
  ['d'] = {':bdelete<cr>', 'Delete Current Buffer'},

  t = {
    name = "Terminal",
    n = {cmd("lua _NODE_TOGGLE()"), "Node"},
    f = {cmd("ToggleTerm dir=\'%:p:h\' direction=float"), "Float"},
    h = {cmd("ToggleTerm dir=\'%:p:h\' size=10 direction=horizontal"), "Horizontal"},
    v = {cmd("ToggleTerm dir=\'%:p:h\' size=80 direction=vertical"), "Vertical"}
  },

  u = {
    name = "Utility",
    c = {
      cmd(
          "lua require('telescope.builtin.internal').colorscheme({enable_preview = true})"),
      "Colorscheme with preview"
    },
    h = {cmd("Telescope help_tags"), "Find Help"},
    M = {cmd("Telescope man_pages"), "Man Pages"},
    k = {cmd("Telescope keymaps"), "Keymaps"},
    C = {cmd("Telescope commands"), "Commands"}
  },
  f = {
    name = 'Finder',
    f = {cmd("Telescope find_files"), "Find files"},
    g = {cmd("Telescope live_grep theme=ivy"), "Find Text"},
    p = {cmd("Telescope projects"), "Projects"},
    r = {cmd("Telescope oldfiles"), "Open Recent File"},
    b = {cmd("Telescope buffers"), "Find Buffers"},
    m = {cmd("TODOTelescope"), "Find Todo Comments"},
    e = {cmd("Telescope file_browser"), "File browser"},
    -- e = {cmd("Telescope file_browser path=%:p:h select_buffer=true"), "File browser"},
  },
  g = {
    name = "Git",
    j = {cmd("lua require 'gitsigns'.next_hunk()"), "Next Hunk"},
    k = {cmd("lua require 'gitsigns'.prev_hunk()"), "Prev Hunk"},
    l = {cmd("lua require 'gitsigns'.blame_line()"), "Blame"},
    p = {cmd("lua require 'gitsigns'.preview_hunk()"), "Preview Hunk"},
    r = {cmd("lua require 'gitsigns'.reset_hunk()"), "Reset Hunk"},
    R = {cmd("lua require 'gitsigns'.reset_buffer()"), "Reset Buffer"},
    u = {cmd("lua require 'gitsigns'.undo_stage_hunk()"), "Undo Stage Hunk"},
    s = {cmd("lua require 'gitsigns'.stage_hunk()"), "Stage Hunk"},
    S = {cmd("lua require 'gitsigns'.stage_buffer()"), "Stage Buffer"},
    o = {cmd("Telescope git_status"), "Open Changed File"},
    b = {cmd("Telescope git_branches"), "Checkout Branch"},
    c = {cmd("Telescope git_commits"), "Checkout Commit"},
    d = {cmd("lua require 'gitsigns'.diffthis()"), "Diff"},
    D = {cmd("lua require 'gitsigns'.diffthis('~')"), "Diff"},
    h = {cmd("DiffviewFileHistory %"), "File History"},
    H = {cmd("DiffviewFileHistory"), "Files History"},
  },

  l = {
    name = "LSP",
    i = {cmd("LspInfo"), "LSP Info"},
    k = {cmd("lua vim.lsp.buf.hover()"), "Hover Doc"},
    K = {cmd("lua vim.lsp.buf.signature_help()"), "Signature help"},
    t = {cmd("lua vim.lsp.buf.type_definition()"), "Type definition"},
    r = {cmd("lua vim.lsp.buf.references()"), "References"},
    a = {cmd("lua vim.lsp.buf.code_action()"), "Code actions"},
    q = {cmd("lua vim.diagnostic.setloclist()"), "QuickFix"},
    d = {cmd("Telescope diagnostics bufnr=0"), "Document Diagnostics"},
    w = {cmd("Telescope diagnostics"), "Workspace Diagnostics"},
    S = {cmd("Telescope lsp_dynamic_workspace_symbols"), "Workspace Symbols"},
    s = {cmd("Telescope lsp_document_symbols"), "Document Symbols"},
    f = {cmd("lua vim.lsp.buf.format()"), "Format file"}
  },
  p = {
    name = 'lazy.nvim',
    i = {cmd("Lazy sync"), "install, clean and update"},
    c = {cmd("Lazy check"), "Check for updates"},
  }
}
local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true
}

local vmappings = {
  ["f"] = {"<esc><cmd>lua vim.lsp.buf.format({range = {1,0}})<cr>", "Format"}
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
