return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {}
            require('telescope').load_extension('projects')
        end
    },
}

