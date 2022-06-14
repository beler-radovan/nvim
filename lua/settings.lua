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

vim.g.mapleader = " "

map('n', '<leader>s', ':w<CR>', opts)
map('n', '<leader>q', ':wq<CR>', opts)
map('n', '<leader>e', ':q!<CR>', opts)
map('n', '<leader>w', '<C-w>w', opts)
map('n', '<leader>h', ':nohlsearch<CR>', opts)
map('n', '<leader>v', ':vnew<CR>', opts)
map('n', '<leader><leader>e', ':w<CR>:source %<CR>', opts)

-- Tabs
map('n', '<leader>n', ':tabnew<CR>', opts)
map('n', '<leader>c', ':tabclose<CR>', opts)
map('n', '<c-n>', ':tabnext<CR>', opts)
map('n', '<c-p>', ':tabprev<CR>', opts)

local api = vim.api

-- Handy functions
P = function(args)
    print(vim.inspect(args))
end

local create_new_file = function(input)
    local path = vim.fn.expand("%:p")
    local file_name = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    -- Remove file extension
    file_name = string.gsub(file_name, "%." .. extension, "")
    local new_file = string.gsub(path, file_name, input)

    vim.cmd("tabnew " .. new_file)
end

-- Create a new file with the same filetype as the current file and open it in a
-- new tab
NewFile = function()
    vim.ui.input({ prompt = "New file name: " }, function(input)
        create_new_file(input)
    end)
end

-- Custom commands
api.nvim_create_user_command("NF", NewFile, {})

-- Abbreviated vim-fugive commands
api.nvim_create_user_command("Gs", "Git status", {})
api.nvim_create_user_command("Ga", "Git add", {})
api.nvim_create_user_command("Gc", "Git commit", {})
api.nvim_create_user_command("Gp", "Git push", {})
api.nvim_create_user_command("Gl", "Git log", {})
