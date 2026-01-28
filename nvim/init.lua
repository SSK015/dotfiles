-- Minimal "server-side distro" for Neovim:
-- - lazy.nvim bootstrap
-- - persistence.nvim: sessions (buffers/tabs/cursor) across restarts
-- - project.nvim + telescope: fast project switching
-- - optional Cursor CLI entrypoints (cursor-agent) inside Neovim

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.background = "light"

-- neo-tree recommends disabling netrw early
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
require("config.cursor_cli")
require("config.lazy")

