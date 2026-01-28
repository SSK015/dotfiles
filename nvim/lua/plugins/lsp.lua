return {
  {
    -- LSP (Neovim 0.11+ has native vim.lsp.config/enable)
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
    build = ":MasonUpdate",
    dependencies = {
      -- Better Lua LSP experience for Neovim config (works with native LSP too)
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    config = function()
      require("mason").setup()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Keymaps on LSP attach (works for both native and plugin-based LSP)
      local group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
          local bufnr = args.buf
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>fd", vim.diagnostic.open_float, "Diagnostics (float)")
          map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      pcall(function()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end)

      local has_native = type(vim.lsp.config) == "table" and type(vim.lsp.enable) == "function"

      if has_native then
        -- Ensure mason bin dir is on PATH (so servers can be found).
        local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
        if not vim.env.PATH:find(mason_bin, 1, true) then
          vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
        end

        -- Install a small default set of language servers via mason.
        local mr = require("mason-registry")
        local ensure_pkgs = {
          "lua-language-server",
          "pyright",
          "bash-language-server",
        }

        local function ensure_installed()
          for _, pkg_name in ipairs(ensure_pkgs) do
            local ok, pkg = pcall(mr.get_package, pkg_name)
            if ok and not pkg:is_installed() then
              pkg:install()
            end
          end
        end

        -- Skip auto-install in headless mode (e.g. CI, scripts), otherwise mason
        -- will warn about aborted installs when Neovim exits.
        if #vim.api.nvim_list_uis() > 0 then
          if type(mr.refresh) == "function" then
            mr.refresh(ensure_installed)
          else
            ensure_installed()
          end
        end

        -- Native LSP configuration (Neovim 0.11+)
        vim.lsp.config["lua_ls"] = {
          cmd = { mason_bin .. "/lua-language-server" },
          filetypes = { "lua" },
          root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
          capabilities = capabilities,
        }

        vim.lsp.config["pyright"] = {
          cmd = { mason_bin .. "/pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "pyrightconfig.json", ".git" },
          capabilities = capabilities,
        }

        vim.lsp.config["bashls"] = {
          cmd = { mason_bin .. "/bash-language-server", "start" },
          filetypes = { "sh", "bash", "zsh" },
          root_markers = { ".git" },
          capabilities = capabilities,
        }

        vim.lsp.enable({ "lua_ls", "pyright", "bashls" })
        return
      end

      -- Fallback for older Neovim: use nvim-lspconfig + mason-lspconfig.
      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "pyright", "bashls" }

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { unpack(servers) },
        automatic_installation = true,
      })

      local function setup_server(server_name)
        if server_name == "lua_ls" then
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
          })
          return
        end

        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end

      if type(mason_lspconfig.setup_handlers) == "function" then
        mason_lspconfig.setup_handlers({
          function(server_name) setup_server(server_name) end,
        })
      else
        for _, server_name in ipairs(servers) do
          setup_server(server_name)
        end
      end
    end,
  },
  -- These are only needed for the fallback path (Neovim < 0.11)
  {
    "williamboman/mason-lspconfig.nvim",
    cond = not (type(vim.lsp.config) == "table" and type(vim.lsp.enable) == "function"),
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    cond = not (type(vim.lsp.config) == "table" and type(vim.lsp.enable) == "function"),
    lazy = true,
  },
}

