return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern" },
    patterns = { ".git", "package.json", "pyproject.toml", "go.mod", "Cargo.toml" },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    -- Integrate with telescope if available.
    pcall(function()
      require("telescope").load_extension("projects")
      vim.keymap.set(
        "n",
        "<leader>fp",
        function() require("telescope").extensions.projects.projects({}) end,
        { desc = "Find projects" }
      )
    end)
  end,
}

