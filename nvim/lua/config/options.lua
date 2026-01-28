-- Basics: keep it small and predictable (good for remote servers).

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.completeopt = { "menu", "menuone", "noselect" }

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 200
opt.timeoutlen = 400

-- Useful on servers when you often juggle multiple projects.
opt.clipboard = "unnamedplus"

