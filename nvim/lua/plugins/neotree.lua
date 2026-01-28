return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer (neo-tree)" },
      { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Explorer focus (neo-tree)" },
    },
    cmd = "Neotree",
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = { padding = 0 },
        icon = { folder_closed = "", folder_open = "", folder_empty = "󰜌" },
        modified = { symbol = "●" },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = "left",
        width = 34,
        mappings = {
          ["<space>"] = "toggle_node",
          ["l"] = "open",
          ["h"] = "close_node",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["q"] = "close_window",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = "Files" },
          { source = "buffers", display_name = "Buffers" },
          { source = "git_status", display_name = "Git" },
        },
      },
    },
  },
}

