-- General settings
local opt = vim.opt
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.colorcolumn = '80'
opt.fileencoding = 'utf-8'
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Shortcuts
local opts = {silent = true, remap = false}
local set = vim.keymap.set
set('n', ',s', ':w<CR>', opts)
set('n', ',q', ':wq<CR>', opts)
set('n', ',e', ':q!<CR>', opts)
set('n', ',w', '<C-w>w', opts)
set('n', ',h', ':nohlsearch<CR>', opts)
