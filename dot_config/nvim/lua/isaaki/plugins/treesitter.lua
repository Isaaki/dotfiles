return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "javascript", "typescript", "vue", "c", "rust", "lua", "vim", "vimdoc" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = true,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			highlight = {
				-- `false` will disable the whole extension
				enable = not vim.g.vscode,

				additional_vim_regex_highlighting = false,
			},
		})

		require("nvim-treesitter.configs").setup({})

		if not vim.g.vscode then
			require("treesitter-context").setup({
				trim_scope = "inner",
			})
		end
	end,
}
