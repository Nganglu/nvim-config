--set leader
vim.g.mapleader = " "

local map = vim.keymap.set

--Files
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Show PWD" })
map("n", "<leader>pV", vim.cmd.Sex, { desc = "Show Split PWD" })
map("n", "<leader>w", ":update<CR>", { desc = "Save file"})

--Terminal
map("n", "<leader>t", vim.cmd.FloatermToggle, { desc = "Toggle Floaterm" })
map("t", "<C-t>", vim.cmd.FloatermToggle, { desc = "Toggle Floaterm" })
map("t", "<C-n>", vim.cmd.FloatermNew, { desc = "New Terminal Instance" })
map("t", "<C-h>", vim.cmd.FloatermPrev, { desc = "Prev Terminal" })
map("t", "<C-s>", vim.cmd.FloatermNext, { desc = "Next Terminal" })
map("t", "<C-x>", vim.cmd.FloatermKill, { desc = "Kill Terminal Instance" })

--Package Manager
map("n", "<leader>L", vim.cmd.Lazy, { desc = "Lazy" })
map("n", "<leader>M", vim.cmd.Mason, { desc = "Mason" })


--ToggleRelativeNumber
local wo = vim.wo
function _G.toggle_number_mode()
  if wo.relativenumber then
    wo.number = true
    wo.relativenumber = false
  else
    wo.number = true
    wo.relativenumber = true
  end
end

vim.api.nvim_set_keymap("n", "<leader>r", ":lua toggle_number_mode()<CR>", { noremap = true, silent = true, desc = "Toggle relative numbers" } )
