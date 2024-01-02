vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

package.path = package.path .. "./lua/?/init.lua"

require('plugins')
require('configs')
require('core')

vim.cmd 'set clipboard=unnamedplus'
vim.cmd 'colorscheme tokyonight-night'

-- auto format
-- vim.api.nvim_create_augroup('AutoFormatting', {})
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     pattern = { '*.lua', '*.rs', '*.c', '*.cpp', '*.h', '*.hpp', '*.go', '*.py' },
--     group = 'AutoFormatting',
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })
