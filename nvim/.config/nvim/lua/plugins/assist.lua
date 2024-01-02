return {
    {
        'github/copilot.vim'
    },
    {
        "ur4ltz/surround.nvim",
        config = function()
            require "surround".setup { mappings_style = "surround" }
        end
    },
    -- gcc
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2', --  but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}

