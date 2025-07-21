local opt = vim.opt

-- Indentatiton
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.autoindent = true
opt.smartindent = true
opt.preserveindent = true

-- White Spaces
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·" }

-- Movement
opt.whichwrap:append("<>hl")

-- Numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true

-- Misc
opt.scrolloff = 1
opt.autoread = true
opt.backspace = { "indent", "eol", "start" }
