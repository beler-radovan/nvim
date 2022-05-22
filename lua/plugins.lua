return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'Mofiqul/vscode.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'L3MON4D3/LuaSnip'
end)
