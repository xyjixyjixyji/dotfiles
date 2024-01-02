            local version = vim.version()
            local header = {
"",
"",
"",
" ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄    ▄▄▄▄▄▄▄ ▄▄▄▄▄▄  ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ",
"█       █       █  █▄█  █       █  █       █      ██   █       █       █   ▄  █  ",
"█▄     ▄█    ▄▄▄█       █▄     ▄█  █    ▄▄▄█  ▄    █   █▄     ▄█   ▄   █  █ █ █  ",
"  █   █ █   █▄▄▄█       █ █   █    █   █▄▄▄█ █ █   █   █ █   █ █  █ █  █   █▄▄█▄ ",
"  █   █ █    ▄▄▄██     █  █   █    █    ▄▄▄█ █▄█   █   █ █   █ █  █▄█  █    ▄▄  █",
"  █   █ █   █▄▄▄█   ▄   █ █   █    █   █▄▄▄█       █   █ █   █ █       █   █  █ █",
"  █▄▄▄█ █▄▄▄▄▄▄▄█▄▄█ █▄▄█ █▄▄▄█    █▄▄▄▄▄▄▄█▄▄▄▄▄▄██▄▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█▄▄▄█  █▄█",
"",
                "N E O V I M - v " .. version.major .. "." .. version.minor,
                "",
            }
            local center = {
                {
                    desc = "Find File                     ",
                    keymap = "",
                    key = "f",
                    icon = " ",
                    action = "lua require('telescope.builtin').find_files()",
                },
                {
                    desc = "Recents Projects",
                    keymap = "",
                    key = "r",
                    icon = " ",
                    -- action = "Telescope oldfiles",
                    action = "lua require'telescope'.extensions.projects.projects{}",
                },
                -- { shortcut = "<leader>fg", icon = " ", desc = "Find Word", action = "Telescope live_grep" },
                {
                    desc = "New File",
                    keymap = "",
                    key = "n",
                    icon = " ",
                    action = "enew",
                },
                {
                    desc = "Update Plugins",
                    keymap = "",
                    key = "u",
                    icon = " ",
                    action = "Lazy update",
                },
                {
                    desc = "Config",
                    keymap = "",
                    key = "c",
                    icon = " ",
                    action = "lua require('telescope.builtin').find_files({cwd='~/.config/nvim'})",
                },
                {
                    desc = "Exit",
                    keymap = "",
                    key = "q",
                    icon = " ",
                    action = "exit",
                },
            }
            local custom_footer = { "This is the way" }
            vim.api.nvim_create_autocmd("Filetype", {
                pattern = "dashboard",
                group = vim.api.nvim_create_augroup("Dashboard_au", { clear = true }),
                callback = function()
                    vim.cmd([[
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler
        ]])
                end,
            })

            require('dashboard').setup({
                theme = 'doom',
                config = {
                    header = header,
                    center = center,
                    footer = custom_footer,
                },

            })
