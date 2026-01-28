-- Cursor CLI integration (server-side).
-- Install on the server:
--   curl https://cursor.com/install -fsS | bash
--   cursor-agent --version

local function open_term(cmd, input)
  vim.cmd("botright split | resize 15")
  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.cmd("startinsert")

  local job_id = vim.fn.termopen(cmd)
  if input and input ~= "" then
    vim.defer_fn(function()
      pcall(vim.fn.chansend, job_id, input .. "\n")
    end, 80)
  end
end

local function cursor_exists()
  return vim.fn.executable("cursor-agent") == 1
end

vim.api.nvim_create_user_command("CursorAgent", function()
  if not cursor_exists() then
    vim.notify("cursor-agent not found in PATH", vim.log.levels.ERROR)
    return
  end
  open_term({ "cursor-agent" })
end, { desc = "Open interactive cursor-agent in a terminal split" })

vim.api.nvim_create_user_command("CursorAsk", function(opts)
  if not cursor_exists() then
    vim.notify("cursor-agent not found in PATH", vim.log.levels.ERROR)
    return
  end
  local prompt = opts.args
  if prompt == "" then
    prompt = vim.fn.input("Cursor prompt: ")
  end
  if prompt == "" then
    return
  end
  -- Use interactive mode in a split so it works even if flags differ across CLI versions.
  open_term({ "cursor-agent" }, prompt)
end, { nargs = "*", desc = "Send a prompt to cursor-agent (opens terminal split)" })

vim.keymap.set("n", "<leader>ca", "<cmd>CursorAgent<cr>", { desc = "Cursor agent (terminal)" })
vim.keymap.set("n", "<leader>cq", "<cmd>CursorAsk<cr>", { desc = "Cursor ask (prompt)" })

