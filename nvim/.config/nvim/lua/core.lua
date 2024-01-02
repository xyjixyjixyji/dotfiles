------------
-- Default settings and keymaps
------------
vim.g.mapleader = ","

vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.lazyredraw = true
vim.o.showmode = true
vim.o.ignorecase = true
vim.o.ruler = true
vim.o.relativenumber = true
vim.o.updatetime = 250
vim.o.breakindent = true
vim.o.mouse = 'a'
vim.o.completeopt = 'menuone,noselect'

vim.wo.signcolumn = 'yes'
vim.wo.number = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4


local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local wk = require("which-key")

------------
-- keymaps
------------
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>sc',
    '<cmd>lua require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown({enable_preview=true}))<CR>',
    { noremap = true, silent = true })

-- no highlights
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- windows
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
map("n", "<leader>h", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<leader>j", "<cmd>resize +2<cr>", { desc = "Decrease window height" })
map("n", "<leader>k", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<leader>l", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- buffers
map("n", "<S-h>", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferNext<cr>", { desc = "Next buffer" })
map("c", "bd", "Bd")

-- esc
map('i', 'jk', '<Esc>', { noremap = false, silent = true })

-- file tree
map('n', '<C-f>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

-- Telescope
wk.register({
    f = {
        name = "Telescope", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { '<cmd>Telescope live_grep<CR>', "Live Grep" },
        b = { "<cmd>Telescope buffers<CR>", "Buffers" },
        h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
    },
}, { prefix = "<leader>" })

-- Trouble.nvim
wk.register({
    x = {
        name = "Trouble",
        x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace Troubles" },
        d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document Troubles" },
        q = { "<cmd>TroubleToggle quickfix<CR>", "Quickfix" },
    },
}, { prefix = "<leader>" })

-- lsp
wk.register({
    g = {
        name = "LSP",
        d = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definitions" },
        r = { "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", "Goto References" },
        i = { "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", "Goto Implementations" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    },
})
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
vim.keymap.set('n', '<leader>sd', "<cmd>Lspsaga finder def+ref<CR>", bufopts)
vim.keymap.set('n', '<leader>ds', "<cmd>Lspsaga outline<CR>", bufopts)
vim.keymap.set('n', '<leader>rs', "<cmd>Lspsaga rename<CR>", bufopts)
vim.keymap.set("n", "[e", '<cmd>lua require("lspsaga.diagnostic"):goto_prev({})<CR>', bufopts)
vim.keymap.set("n", "]e", '<cmd>lua require("lspsaga.diagnostic"):goto_next({})<CR>', bufopts)

wk.register({
    c = {
        name = "code actions/format",
        a = { "<cmd>Lspsaga code_action<CR>", "Code action" },
        f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Code" },
    },
}, { prefix = "<leader>" })

-- session
wk.register({
    S = {
        name = "Session",
        l = { "<cmd>lua require'persistence'.load()<cr>", "Restore session for curdir" },
        r = { "<cmd>lua require'persistence'.load({ last = true })<CR>", "Restore last session" },
        s = { "<cmd>lua require'persistence'.stop()<CR>", "Stop persisting sessions" },
    },
}, { prefix = "<leader>" })

-- misc
-- toggle term
vim.keymap.set({ 'n', 't' }, '<A-j>', '<cmd>Lspsaga term_toggle<CR>', bufopts)


--------------------
-- Startup commands
--------------------
