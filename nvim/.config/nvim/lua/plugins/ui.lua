return {
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require "todo-comments".setup {}
        end
    },
    {
        'rcarriga/nvim-notify',
    },
    {
        -- the context on the tabline
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configurations go here
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require('ibl').setup({
                exclude = {
                    filetypes = {
                        'lspinfo',
                        'packer',
                        'checkhealth',
                        'help',
                        'man',
                        'dashboard',
                        '',
                    },
                },
            })
        end,
        opts = {}
    },
    --
    -- colorschemes below
    --
    {
        'marko-cerovac/material.nvim',
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        'ellisonleao/gruvbox.nvim',
    },
    {
        'oxfist/night-owl.nvim',
    },
    {
        'wadackel/vim-dogrun',
    },
    {
        'Ji-Xinyou/vim-256noir',
    },
    {
        'plan9-for-vimspace/acme-colors',
    },
    {
        'Mofiqul/vscode.nvim',
    },
    {
        'rktjmp/lush.nvim',
    },
    {
        'folke/tokyonight.nvim',
    },
    {
        'EdenEast/nightfox.nvim',
    },
}
