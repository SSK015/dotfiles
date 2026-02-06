local map = vim.keymap.set

-- Keep keymaps minimal; plugins add their own under <leader>.
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Quick fuzzy find (telescope)
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

-- Jump 5 lines at a time with Ctrl+Up/Down
map({ "n", "v" }, "<C-Up>", "5k", { desc = "Up 5 lines" })
map({ "n", "v" }, "<C-Down>", "5j", { desc = "Down 5 lines" })

-- Terminal fallbacks: some terminals (including Tabby) may send raw escape
-- sequences for Ctrl+Up/Down, or intercept those keys entirely.
local esc = string.char(27)
map({ "n", "v" }, esc .. "[1;5A", "5k", { desc = "Up 5 lines (Ctrl+Up seq)" })
map({ "n", "v" }, esc .. "[1;5B", "5j", { desc = "Down 5 lines (Ctrl+Down seq)" })
map({ "n", "v" }, esc .. "[5A", "5k", { desc = "Up 5 lines (Alt/Ctrl seq)" })
map({ "n", "v" }, esc .. "[5B", "5j", { desc = "Down 5 lines (Alt/Ctrl seq)" })

-- Reliable fallback keys (in case the terminal intercepts Ctrl+Arrow).
map({ "n", "v" }, "<C-k>", "5k", { desc = "Up 5 lines" })
map({ "n", "v" }, "<C-j>", "5j", { desc = "Down 5 lines" })
-- In many terminals Ctrl+j is indistinguishable from <NL> (linefeed).
map({ "n", "v" }, "<NL>", "5j", { desc = "Down 5 lines (Ctrl+j/<NL>)" })

