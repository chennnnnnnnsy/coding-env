local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup {
  ensure_installed = {
    "c", "cpp", "lua", "bash", "python", "typescript", "javascript", "rust",
    "html", "json", "java", "css", "scss", "svelte", "vim", "vue", "tsx",
    "solidity"
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {""}, -- List of parsers to ignore installing
  autopairs = {enable = true},
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte',
      'vue', "typescript"
    }
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {""}, -- list of language that will be disabled
    additional_vim_regex_highlighting = true
  },
  indent = {enable = true, disable = {"yaml"}},
  rainbow = {enable = true, extended_mode = true, max_file_lines = 1000}
}
