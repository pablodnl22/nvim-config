require("pablodnl22")


local augroup = vim.api.nvim_create_augroup
local Pablodnl22 = augroup('Pablodnl22', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
    group = Pablodnl22,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({"TextYankPost"}, {
    group = Pablodnl22,
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end
})
