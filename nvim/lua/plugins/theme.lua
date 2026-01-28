return {
  {
    -- VSCode-like Light+ theme
    "Mofiqul/vscode.nvim",
    name = "vscode",
    lazy = false,
    priority = 1000,
    config = function()
      -- Transparent + light background often looks "too bright" because it
      -- shows your terminal's pure white. Set to true if you really want it.
      local transparent = true

      vim.opt.background = "light"
      require("vscode").setup({
        -- Keep styling close to VSCode defaults
        transparent = transparent,
        terminal_colors = true,
        italic_comments = false,
        -- Make the overall look a bit "darker"/higher-contrast on light bg.
        -- (Your VSCode settings.json has no extra customizations; the perceived
        -- difference is usually from background + popup opacity/colors.)
        color_overrides = {
          vscFront = "#1F1F1F",
          vscLineNumber = "#6B6B6B",
        },
        group_overrides = {
          -- Keep popups/menus non-transparent (more VSCode-like)
          Normal = { fg = "#1F1F1F", bg = "NONE" },
          NormalNC = { fg = "#1F1F1F", bg = "NONE" },
          SignColumn = { bg = "NONE" },
          EndOfBuffer = { bg = "NONE" },
          -- Make whitespace/line-numbers a touch deeper (less "washed out")
          LineNr = { fg = "#6B6B6B", bg = "NONE" },
          CursorLineNr = { fg = "#1F1F1F", bg = "NONE" },
          NonText = { fg = "#8A8A8A" },

          -- neo-tree defaults its tab colors for dark themes; override for light.
          -- (Fixes the black "Files/Buffers/Git" blocks you saw.)
          NeoTreeTabActive = { fg = "#1F1F1F", bg = "#F3F3F3", bold = true },
          NeoTreeTabInactive = { fg = "#6B6B6B", bg = "#E5E5E5" },
          NeoTreeTabSeparatorActive = { fg = "#C4C4C4", bg = "#F3F3F3" },
          NeoTreeTabSeparatorInactive = { fg = "#C4C4C4", bg = "#E5E5E5" },
          NeoTreeWinSeparator = { fg = "#C4C4C4", bg = "NONE" },
        },
      })
      vim.cmd.colorscheme("vscode")

      local function apply_neotree_overrides()
        if vim.g.colors_name ~= "vscode" then
          return
        end

        local c = require("vscode.colors").get_colors()
        local hl = vim.api.nvim_set_hl

        -- If your terminal's transparency is image-based, some cells with bg=NONE
        -- can appear as dark blocks. Make the neo-tree window use a subtle solid
        -- light background (VSCode explorer is not transparent anyway).
        hl(0, "NeoTreeNormal", { fg = c.vscFront, bg = c.vscPopupBack })
        hl(0, "NeoTreeNormalNC", { fg = c.vscFront, bg = c.vscPopupBack })
        hl(0, "NeoTreeSignColumn", { bg = c.vscPopupBack })
        hl(0, "NeoTreeEndOfBuffer", { fg = c.vscPopupBack, bg = c.vscPopupBack })
        hl(0, "NeoTreeCursorLine", { bg = c.vscLeftMid })

        hl(0, "NeoTreeTabActive", { fg = c.vscFront, bg = c.vscPopupBack, bold = true })
        hl(0, "NeoTreeTabInactive", { fg = c.vscCursorLight, bg = c.vscLeftLight })
        hl(0, "NeoTreeTabSeparatorActive", { fg = c.vscLeftDark, bg = c.vscPopupBack })
        hl(0, "NeoTreeTabSeparatorInactive", { fg = c.vscLeftDark, bg = c.vscLeftLight })
        hl(0, "NeoTreeWinSeparator", { fg = c.vscLeftDark, bg = "NONE" })

        -- Tone down "too bright" yellow/orange in neo-tree git/modified markers.
        -- Use a deeper green (closer to VSCode's light theme greens).
        local deep_green = "#0B6E4F"
        -- IMPORTANT: neo-tree will "default" missing fg/bg pairs; set bg to the
        -- neo-tree window background so our colors don't get overwritten.
        hl(0, "NeoTreeGitUntracked", { fg = deep_green, bg = c.vscPopupBack, italic = true })
        hl(0, "NeoTreeGitUnstaged", { fg = deep_green, bg = c.vscPopupBack, bold = true, italic = true })
        hl(0, "NeoTreeGitConflict", { fg = deep_green, bg = c.vscPopupBack, bold = true, italic = true })
        hl(0, "NeoTreeGitModified", { fg = deep_green, bg = c.vscPopupBack })
        hl(0, "NeoTreeGitAdded", { fg = deep_green, bg = c.vscPopupBack })
        hl(0, "NeoTreeGitDeleted", { fg = "#A31515", bg = c.vscPopupBack })
        hl(0, "NeoTreeModified", { fg = deep_green, bg = c.vscPopupBack })
      end

      -- Apply once now, and again whenever neo-tree buffers open or theme reloads.
      apply_neotree_overrides()
      local augroup = vim.api.nvim_create_augroup("UserThemeNeoTree", { clear = true })
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        group = augroup,
        callback = apply_neotree_overrides,
      })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = augroup,
        pattern = "neo-tree",
        callback = apply_neotree_overrides,
      })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = augroup,
        pattern = "neo-tree-popup",
        callback = apply_neotree_overrides,
      })

      -- Note: keep FloatBorder solid (VSCode-like). If you set FloatBorder bg="none"
      -- it can look "washed out" on transparent backgrounds.
    end,
  },
  -- Keep TokyoNight installed for easy switching if you want it later.
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
  },
  -- Keep Catppuccin installed for easy switching if you want it later.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "latte",
      transparent_background = true,
      term_colors = true,
      integrations = {
        telescope = true,
        neotree = true,
      },
    },
  },
}

