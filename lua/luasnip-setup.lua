local ls = require('luasnip')

ls.config.setup({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = false,
})

vim.keymap.set({'i', 's'}, '<a-j>',
    function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end,
    {silent = true}
)

vim.keymap.set({'i', 's'}, '<a-k>',
    function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end,
    {silent = true}
)

vim.keymap.set({'i', 's'}, '<a-l>',
    function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end,
    {silent = true}
)

vim.keymap.set({'n'}, ',,s', ':source ~/.config/nvim/lua/luasnip-setup.lua<CR>')

require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/snippets'})
