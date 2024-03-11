local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      } -- i
    } -- mappings
  }, -- defaults
  pickers = {
    find_files = {
      hidden = false
    }
  }
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[F]ind files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
--this functions requires ripgrep
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
--vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch current [W]ord' })
--
-- lsp code references
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, { desc = '[R]eferences' })

-- new mappings
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })
