return {
	"kepano/flexoki-neovim",
	name = "flexoki",
	lazy = false,
	priority = 1000,
	config = function()
		require("flexoki").setup({
			variant = "auto",
			dark_variant = "dark",
			light_variant = "light",
		})

		vim.cmd.colorscheme("flexoki")
	end,
}
