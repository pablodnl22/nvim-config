-- Ensure Mason is installed and does not auto-attach
require("mason").setup()

require("mason-lspconfig").setup({
  -- NO auto-install, NO auto-setup
    automatic_enable = {
        exclude = {
            -- in previous version those LSP were enabled twice
            --"pyright",
            --"ruff"
        }
    }
})

local lsp = require("lsp-zero").preset({
    manage_nvim_cmp = true,
    call_servers = "local",
    set_lsp_keymaps = false, -- we define them manually
    float_border = "rounded",
})

local telescope = require("telescope.builtin")

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gr", telescope.lsp_references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", telescope.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- Configure servers
lsp.configure("lua_ls", lsp.nvim_lua_ls())

lsp.configure("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            }
        }
    }
})

lsp.configure("ruff", {
    init_options = {
        settings = {
            args = {},
        },
    },
})

-- Setup all LSPs
lsp.setup()

-- Setup nvim-cmp
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
    }, {
        { name = "buffer" },
    }),
})

-- Diagnostics config
vim.diagnostic.config({
    virtual_text = true,
})

-- Toggle virtual text
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current })
end, {})

vim.keymap.set("n", "<leader>dh", "<cmd>DiagnosticsToggleVirtualText<CR>", { desc = "[D]iagnostics [H]ide virtual text" })

-- Toggle diagnostics entirely
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
    if vim.diagnostic.is_disabled() then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end, {})

