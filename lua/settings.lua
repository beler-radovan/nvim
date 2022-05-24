-- General settings
local set = vim.opt
set.relativenumber = true
set.number = true
set.splitright = true
set.splitbelow = true
set.swapfile = false
set.colorcolumn = '80'
set.fileencoding = 'utf-8'
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.ignorecase = true
set.smartcase = true
set.laststatus = 3
set.showtabline = 2

-- Shortcuts
local opts = {silent = true, remap = false}
local map = vim.keymap.set
map('n', ',s', ':w<CR>', opts)
map('n', ',q', ':wq<CR>', opts)
map('n', ',e', ':q!<CR>', opts)
map('n', ',w', '<C-w>w', opts)
map('n', ',h', ':nohlsearch<CR>', opts)

-- Tabs
map('n', ',n', ':tabnew<CR>', opts)
map('n', ',c', ':tabclose<CR>', opts)
map('n', '<c-n>', ':tabnext<CR>', opts)
map('n', '<c-p>', ':tabprev<CR>', opts)
