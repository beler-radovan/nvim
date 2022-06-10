local map = vim.keymap.set
local opts = { silent = true, remap = false }

map("n", ",g", ":Goyo<CR>", opts)
