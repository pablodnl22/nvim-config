local telescope = require("telescope")
local builtin = require("telescope.builtin")
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
            }, -- n
            i = {
                ["<C-h>"] = "which_key",
                ["<c-d>"] = require("telescope.actions").delete_buffer,
            }, -- i
        }, -- mappings
    }, -- defaults
    pickers = {
        buffers = {
            sort_lastused = true,
        },
        find_files = {
            hidden = false,
        },
    },
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[F]ind files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
--vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch current [W]ord' })
--
-- lsp code references
vim.keymap.set("n", "<leader>pr", builtin.lsp_references, { desc = "[R]eferences" })

-- new mappings
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sf", function()
    builtin.find_files({
        find_command = { "sh", "-c", "rg --files && rg --files --no-ignore --glob '.env*'" },
    })
end, { desc = "[S]earch [F]iles" })

--vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
--this functions requires ripgrep
vim.keymap.set("n", "<leader>sg", function()
    builtin.grep_string({ search = vim.fn.input("May the Force be with you. > ") })
end, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
--vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "[S]earch [J]umplist" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

local tb = require("telescope.builtin")

vim.keymap.set("v", "<leader>sf", function()
    local text = vim.getVisualSelection()
    tb.find_files({ default_text = text })
end, { noremap = true, silent = true, desc = "[S]earch [F]iles" })

vim.keymap.set("v", "<leader>sg", function()
    local text = vim.getVisualSelection()
    builtin.grep_string({ search = text })
end, { noremap = true, silent = true, desc = "[S]earch by [G]rep" })

--- Python search for class instances
--- This function takes the highlighted text and append a `(` character
vim.keymap.set("v", "<leader>sn", function()
    local text = vim.getVisualSelection()
    local search = text .. "("
    builtin.grep_string({ search = search })
end, { noremap = true, silent = true, desc = "[S]earch [N]ew Instances" })


--- Python search for class extensions
--- This function takes the highlighted text and wraps it with `(` and `)`
vim.keymap.set("v", "<leader>se", function()
    local text = vim.getVisualSelection()
    local search = "(" .. text .. ")"
    builtin.grep_string({ search = search })
end, { noremap = true, silent = true, desc = "[S]earch [E]xtensions" })

--- Python search for implementations
--- This function takes the highlighted text and wraps it with `(`
vim.keymap.set("v", "<leader>si", function()
    local text = vim.getVisualSelection()
    local search = text .. "("
    builtin.grep_string({ search = search })
end, { noremap = true, silent = true, desc = "[S]earch [I]mplementations" })




local function oldfiles_in_cwd()
  local cwd = vim.loop.cwd()
  local filtered = {}


   for _, file in ipairs(vim.v.oldfiles) do
    if
      vim.fn.filereadable(file) == 1 and
      file:sub(1, #cwd) == cwd and
      not file:match("/%.git/")  -- exclude anything inside .git/
    then
      table.insert(filtered, file)
    end
  end

  pickers.new({}, {
    prompt_title = 'Recent Files (CWD)',
    finder = finders.new_table {
      results = filtered
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.cmd('edit ' .. vim.fn.fnameescape(selection.value))
      end)
      return true
    end,
  }):find()
end


vim.keymap.set('n', '<leader>s.', oldfiles_in_cwd, { desc = 'Telescope: Oldfiles in cwd' })


