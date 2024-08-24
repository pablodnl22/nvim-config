local function highlight_snake_to_camel()
    vim.cmd([[silent! '<,'>s/\v(_\w)/\U\1/g | silent! '<,'>s/\v_//g]])
    vim.cmd([[noh]])
end

local function hightligh_split_comma()
    vim.cmd([[silent! '<,'>s/\v,/,\r/g]])
    vim.cmd([[normal! vip=]])
    vim.cmd([[noh]])
end

vim.api.nvim_create_user_command(
    'HsnakeToCamel',
    highlight_snake_to_camel,
    { range = true, nargs = 0 }
)

vim.api.nvim_create_user_command(
    'HsplitComma',
    hightligh_split_comma,
    { range = true, nargs = 0 }
)

