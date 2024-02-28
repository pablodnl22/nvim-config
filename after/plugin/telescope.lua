local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    pickers = {
        find_files = {
            hidden = false
        }
    }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[F]ind files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
--this functions requires ripgrep
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
--vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch current [W]ord' })
--
-- lsp code references
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, { desc = '[R]eferences' })

