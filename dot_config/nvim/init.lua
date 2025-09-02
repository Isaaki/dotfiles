require("isaaki/settings")
require("isaaki/remap")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- Basic plugins (No Config)
		{ "mg979/vim-visual-multi", branch = "master" },

		-- Plugins with configurations
		require("isaaki/plugins/comment"),
		require("isaaki/plugins/eyeliner"),
		require("isaaki/plugins/surround"),
		require("isaaki/plugins/treesitter"),
		require("isaaki/plugins/whichkey"),
		require("isaaki/plugins/replace-with-register"),

		-- if not vim.g.vscode then
		require("isaaki/plugins/colors"),
		require("isaaki/plugins/autopairs"),
		require("isaaki/plugins/bufferline"),

		require("isaaki/plugins/nvim-cmp"),
		-- require("isaaki/plugins/blink-cmp"),

		require("isaaki/plugins/lsp"),
		-- require("isaaki/plugins/neodev"),
		require("isaaki/plugins/lualine"),
		require("isaaki/plugins/telescope"),
		require("isaaki/plugins/undotree"),
		require("isaaki/plugins/trouble"),
		require("isaaki/plugins/toggleterm"),
		require("isaaki/plugins/gitsigns"),
		-- require("isaaki/plugins/auto-session"),
		require("isaaki/plugins/flash"),
		require("isaaki/plugins/lazydev"),
		require("isaaki/plugins/luvit-meta"),
		require("isaaki/plugins/conform"),
		require("isaaki/plugins/nvim-ufo"),
		-- require("isaaki/plugins/hardtime"),
		-- end
	},
})
