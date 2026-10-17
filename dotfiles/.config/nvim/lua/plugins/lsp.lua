return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason-lspconfig").setup({ ensure_installed = { "gopls", "lua_ls", "pyright" } })

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.enable({ "gopls", "lua_ls", "pyright" })

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf })
				vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf })
				vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = ev.buf })
				vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = ev.buf })
			end,
		})
	end,
}
