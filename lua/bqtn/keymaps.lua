--set leader
vim.g.mapleader = " "

local map = vim.keymap.set

--Files
map("n","<leader>pv", vim.cmd.Ex,{desc="Show PWD"})
map("n","<leader>pV", vim.cmd.Sex,{desc="Show Split PWD"})

--Terminal
map("n","<leader>t", vim.cmd.FloatermToggle,{desc="Terminal"})

--Package Manager
map("n","<leader>L", vim.cmd.Lazy,{desc="Lazy"})
map("n","<leader>M", vim.cmd.Mason,{desc="Mason"})
