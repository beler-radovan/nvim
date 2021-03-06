return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'
    -- Themes and icons
    use 'Mofiqul/vscode.nvim'
    use 'kyazdani42/nvim-web-devicons'
    -- Snippets
    use 'L3MON4D3/LuaSnip'
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    -- Comments
    use 'numToStr/Comment.nvim'
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
        }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- Git
    use 'tpope/vim-fugitive'
    -- Neorg
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim"
    }
    -- Misc
    use 'junegunn/goyo.vim'
    -- My own plugins
--    use '/home/rabakel/Projects/plugins/tofloat'
--    use '/home/rabakel/Projects/plugins/mdim'
end)
