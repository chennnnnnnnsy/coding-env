vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc= "退出", silent = true})
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc= "保存", silent = true})
vim.keymap.set("n", "H", "^", { desc= "到行首", silent = true})
vim.keymap.set("n", "L", "$", { desc= "到行尾", silent = true})
vim.keymap.set("n", "P", "\"+p", { desc= "系统粘贴", silent = true})
vim.keymap.set("n", "Y", "\"+y", { desc= "系统复制", silent = true})
vim.keymap.set("v", "Y", "\"+y", { desc= "系统复制", silent = true})
vim.keymap.set("n", "<leader>n", "<Cmd>nohl<CR>", { desc= "取消高亮", silent = true})
vim.keymap.set("n", "n", "nzz", { silent = true})
vim.keymap.set("n", "N", "Nzz", { silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true})

