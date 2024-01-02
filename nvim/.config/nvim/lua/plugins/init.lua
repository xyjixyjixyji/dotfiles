local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

local autopairs = require('plugins.autopairs')
local telescope = require('plugins.telescope')
local assist = require('plugins.assist')
local dashboard = require('plugins.dashboard')
local cmp = require('plugins.cmp')
local ui = require('plugins.ui')
local dap = require('plugins.dap')
local git = require('plugins.git')
local lsp = require('plugins.lsp')
local rust = require('plugins.rust')
local session = require('plugins.session')
local tree = require('plugins.tree')
local treesitter = require('plugins.treesitter')
local whichkey = require('plugins.whichkey')

local concatenateTables = function(...)
    local result = {}
    for _, tableToConcatenate in ipairs {...} do
        for i = 1, #tableToConcatenate do
            result[#result + 1] = tableToConcatenate[i]
        end
    end
    return result
end

local plugins = concatenateTables(assist, autopairs, cmp, ui, dap, lsp, rust, session, tree, telescope,
    treesitter, whichkey, git, dashboard)

require("lazy").setup(plugins, {
    defaults = {
        lazy = false
    }
})
