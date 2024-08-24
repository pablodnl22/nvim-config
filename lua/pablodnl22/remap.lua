vim.o.clipboard = "unnamed"

vim.g.mapleader = " "
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

vim.keymap.set('v', '<leader>p', '"0p', { noremap = true })
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true })
vim.keymap.set('v', '<leader>c', '"_c', { noremap = true })

vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>o', 'o<Esc>k', { noremap = true })
vim.keymap.set('n', '<leader>O', 'O<Esc>j', { noremap = true })

vim.keymap.set('n', '$', 'g_', { noremap = true })
vim.keymap.set('v', '$', 'g_', { noremap = true })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- save and close all
vim.keymap.set('n', 'ZZ', '<cmd>wa<CR><cmd>qa<CR>', { noremap = true })
vim.keymap.set('n', '<space>w', '<cmd>wa<CR>', { noremap = true })

-- quickfix
vim.keymap.set('n', 'gn', '<cmd>cnext<CR>', { noremap = true, desc = 'Go to [N]ext quickfix item' })
vim.keymap.set('n', 'gp', '<cmd>cprev<CR>', { noremap = true, desc = 'Go to [P]revious quickfix item'})
vim.keymap.set('n', '<C-q>', '<cmd>cclose<CR>', { noremap = true, desc = '[Q]uickfix close' })

-- insert mode
-- unbind C-t
vim.keymap.set('i', '<C-t>', '<Nop>', { noremap = true })

-- semicolon normal mode
vim.keymap.set('n', '<leader>,', 'A;<Esc>', { noremap = true, desc = 'Insert semicolon at the end of the line' })

-- Buffer navigation
vim.keymap.set('n', '<Tab>', '<cmd>bp<CR>', { noremap = true, desc = 'Go to [P]revious buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bn<CR>', { noremap = true, desc = 'Go to [N]ext buffer' })

