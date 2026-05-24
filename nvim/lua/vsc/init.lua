local actionFn = function(actionKey)
  return function() 
    require("vscode").action(actionKey)
  end
end

vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.g.lspconfig_enabled = false

vim.keymap.set("n", "gd", actionFn('editor.action.revealDefinition'), { desc= "跳转到定义", silent = true, noremap = true})
vim.keymap.set("n", "gi", actionFn('editor.action.goToImplementation'), { desc= "跳转到实现", silent = true, noremap = true})
vim.keymap.set("n", "gr", actionFn('editor.action.goToReferences'), { desc= "跳转到引用", silent = true, noremap = true})
vim.keymap.set("n", "gR", actionFn('editor.action.rename'), { desc= "重命名", silent = true, noremap = true})
vim.keymap.set("n", "g[", actionFn('workbench.action.editor.nextChange'), { desc= "下一个改变", silent = true, noremap = true})
vim.keymap.set("n", "g]", actionFn('workbench.action.editor.previousChange'), { desc= "上一个改变", silent = true, noremap = true})
vim.keymap.set("n", "<C-j>", actionFn('workbench.action.navigateDown'), { desc= "向下移动", silent = true, noremap = true})
vim.keymap.set("n", "<C-k>", actionFn('workbench.action.navigateUp'), { desc= "向上移动", silent = true, noremap = true})
vim.keymap.set("n", "<C-l>", actionFn('workbench.action.navigateRight'), { desc= "向右移动", silent = true, noremap = true})
vim.keymap.set("n", "<C-h>", actionFn('workbench.action.navigateLeft'), { desc= "向左移动", silent = true, noremap = true})
vim.keymap.set("n", "<leader>d", actionFn('workbench.action.closeActiveEditor'), { desc= "关闭当前编辑器", silent = true, noremap = true})
vim.keymap.set("n", "<leader>bj", actionFn('workbench.action.nextEditor'), { desc= "下一个编辑器", silent = true, noremap = true})
vim.keymap.set("n", "<leader>bk", actionFn('workbench.action.previousEditor'), { desc= "上一个编辑器", silent = true, noremap = true})
vim.keymap.set("n", "<leader>bc", actionFn('workbench.action.closeOtherEditors'), { desc= "上一个编辑器", silent = true, noremap = true})
vim.keymap.set("n", "<leader>ff", actionFn('workbench.action.quickOpen'), { desc= "快速打开文件", silent = true, noremap = true})
vim.keymap.set("n", "<leader>fr", actionFn('workbench.action.showAllEditors'), { desc= "已打开的文件列表", silent = true, noremap = true})
vim.keymap.set("n", "<leader>la", actionFn('editor.action.quickFix'), { desc= "快速修复", silent = true, noremap = true})
vim.keymap.set("n", "<leader>lf", actionFn('editor.action.formatDocument'), { desc= "格式化文档", silent = true, noremap = true})
vim.keymap.set("v", "<leader>lf", actionFn('editor.action.formatDocument'), { desc= "格式化文档", silent = true, noremap = true})
vim.keymap.set("n", "<leader>lk", actionFn('editor.action.showHover'), { desc= "显示悬浮提示", silent = true, noremap = true})
vim.keymap.set("n", "<leader>ld", actionFn('editor.action.peekDefinition'), { desc= "查看定义", silent = true, noremap = true})
vim.keymap.set("n", "<leader>lD", actionFn('editor.action.peekTypeDefinition'), { desc= "查看类型定义", silent = true, noremap = true})
vim.keymap.set("n", "<leader>li", actionFn('editor.action.peekImplementation'), { desc= "查看实现", silent = true, noremap = true})
vim.keymap.set("n", "<leader>lI", actionFn('editor.action.peekDeclaration'), { desc= "查看声明", silent = true, noremap = true})
vim.keymap.set("n", "<leader>lr", actionFn('editor.action.referenceSearch.trigger'), { desc= "查看引用", silent = true, noremap = true})
vim.keymap.set("n", "za", actionFn('editor.toggleFold'), { desc= "折叠/展开", silent = true, noremap = true})