return {
	"folke/tokyonight.nvim",
	"projekt0n/github-nvim-theme",
	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("catppuccin-frappe")

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
}
