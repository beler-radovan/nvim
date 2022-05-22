local map = vim.keymap.set

local on_attach = function(_, bufnr)
    -- General
    map('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})
    map('n', 'gd', vim.lsp.buf.definition, {buffer = bufnr})
    map('n', 'gD', vim.lsp.buf.declaration, {buffer = bufnr})
    map('n', 'gD', vim.lsp.buf.declaration, {buffer = bufnr})
    map('n', 'gr', vim.lsp.buf.rename, {buffer = bufnr})
    -- Diagnostics
    map('n', 'gdn', vim.diagnostic.goto_next, {buffer = bufnr})
    map('n', 'gdp', vim.diagnostic.goto_prev, {buffer = bufnr})
    map('n', 'gdf', vim.diagnostic.goto_prev, {buffer = bufnr})
    map('n', 'gda', vim.lsp.buf.code_action, {buffer = bufnr})
end

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,

    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
