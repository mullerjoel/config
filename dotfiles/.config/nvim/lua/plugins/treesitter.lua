return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter").install({
			"go",
			"lua",
			"java",
			"typescript",
			"markdown",
			"markdown_inline",
			"python",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
