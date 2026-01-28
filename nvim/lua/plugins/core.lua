return {
  -- dependencies used by many plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- telescope: fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
}

