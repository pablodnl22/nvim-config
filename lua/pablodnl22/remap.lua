vim.o.clipboard = "unnamed"

vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

vim.keymap.set('v', '<leader>p', '"_dP', { noremap = true })
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true })
vim.keymap.set('v', '<leader>c', '"_c', { noremap = true })

vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })

vim.keymap.set('v', '<leader>gp', 'f)', { noremap = true })
vim.keymap.set('n', '<leader>gp', 'f)', { noremap = true })
vim.keymap.set('v', '<leader>gP', 'f(', { noremap = true })
vim.keymap.set('n', '<leader>gP', 'f(', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })

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

