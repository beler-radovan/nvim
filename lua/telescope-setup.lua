require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

require('telescope').load_extension('fzf')

-- Telescope keymaps
local map = vim.keymap.set
local opts = {silent = true, remap = false}

map("n", ",ff", ":Telescope find_files<CR>", opts)
map("n", ",f/", ":Telescope live_grep<CR>", opts)
map("n", ",fc", ":Telescope git_commits<CR>", opts)
map("n", ",fb", ":Telescope git_bcommits<CR>", opts)
map("n", ",fh", ":Telescope help_tags<CR>", opts)
