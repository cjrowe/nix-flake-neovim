require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "python",
    "javascript",
    "typescript",
    "hcl", -- For Terraform
    "lua",
    "bash",
    "yaml",
    "json",
    "nix"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
