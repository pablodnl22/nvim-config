require("copilot").setup({
    filetypes = {
        gitcommit = { enabled = true }, -- Enable for git commit messages
        yaml = { enabled = true },      -- Enable for YAML files
        markdown = { enabled = true },  -- Enable for Markdown files
    },
})

