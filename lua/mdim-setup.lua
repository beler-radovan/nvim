local mdim = require("mdim")

mdim.setup({
    viewer = "evince",
    template = "eisvogel",
})

local map = vim.keymap.set
local opts = { silent = true, remap = false }

map("n", "gmi", mdim.init, opts)
-- map("n", "gmc", mdim.compile, opts)

-- vim.api.nvim_buf_create_user_command(0, "MdCompile", mdim.compile, {})
-- vim.api.nvim_create_autocmd("BufWritePost", { command = "MdCompile", })
