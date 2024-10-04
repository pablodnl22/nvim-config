local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", 4 },
        }),
		null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.mypy,
        require("none-ls.formatting.autopep8"),
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { silent = true, desc = "LSP Format" })
