local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<a-f>'] = cmp.mapping.scroll_docs(4),
        ['<a-b>'] = cmp.mapping.scroll_docs(-4),
        ['<a-n>'] = cmp.mapping.select_next_item(),
        ['<a-p>'] = cmp.mapping.select_prev_item(),
        ['<a-e>'] = cmp.mapping.abort(),
        ['<a-y>'] = cmp.mapping.complete(),
        ['<a-;>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        {name = 'luasnip'},
        {name = 'nvim_lua'},
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'buffer', keyword_length = 5},
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
})
