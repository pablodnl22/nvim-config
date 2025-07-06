require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = true, -- ✅ triggers suggestions as you type
        debounce = 75,       -- optional: delay in ms before showing suggestion
        keymap = {
            accept = "<C-l>", -- ✅ change to your preferred accept key
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        gitcommit = { enabled = true }, -- Enable for git commit messages
        yaml = { enabled = true },      -- Enable for YAML files
        markdown = { enabled = true },  -- Enable for Markdown files
    },
})

