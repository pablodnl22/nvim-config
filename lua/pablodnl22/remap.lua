vim.o.clipboard = "unnamed"

vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('v', '<leader>p', '"_dP', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })

