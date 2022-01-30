local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving/Sourcing
keymap('n', '<leader>sf', ':w<cr>', term_opts)
keymap('n', '<leader>so', ':so %<cr>', term_opts)
keymap('n', '<leader>sn', ':so $MYVIMRC<cr>', term_opts)
keymap('n', '<leader>q',  ':bd<cr>', term_opts)

keymap('n', '<C-u>', '<C-u>zz', term_opts)
keymap('n', '<C-d>', '<C-d>zz', term_opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap('n', '<leader>e', ':26Vex<cr>', term_opts)

