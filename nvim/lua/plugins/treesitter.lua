return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "python",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
      },
    },
    config = function(_, opts)
      -- nvim-treesitter changed its public module over time:
      -- older: require("nvim-treesitter.configs").setup(...)
      -- newer: require("nvim-treesitter").setup(...)
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok and type(configs.setup) == "function" then
        configs.setup(opts)
      else
        require("nvim-treesitter").setup(opts)
      end
    end,
  },
}

