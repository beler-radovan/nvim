local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/rabakel/.cache/jdtls-workspace/' .. project_name
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local config = {
    cmd = {
        -- 💀
        'java', -- or '/path/to/java11_or_newer/bin/java'
                -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        -- '--add-modules=ALL-SYSTEM',
        -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        -- '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
             -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
             -- Must point to the                                                     Change this to
             -- eclipse.jdt.ls installation                                           the actual version
        '-jar', '/home/rabakel/Source/jdt-language-server-1.12.0-202206011637/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',


        -- 💀
        -- '-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
                        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                        -- Must point to the                      Change to one of `linux`, `win` or `mac`
                        -- eclipse.jdt.ls installation            Depending on your system.
        '-configuration', '/home/rabakel/Source/jdt-language-server-1.12.0-202206011637/config_linux/',


        -- 💀
        -- See `data directory configuration` section in the README
        '-data', workspace_dir,
    },

    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

    capabilities = capabilities,
}

require('jdtls').start_or_attach(config)
