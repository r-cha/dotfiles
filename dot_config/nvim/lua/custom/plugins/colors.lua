return {
	"nuvic/flexoki-nvim",
	name = "flexoki",
	lazy = false,
	priority = 1000,
	config = function()
		require("flexoki").setup({
			variant = "auto",
			highlight_groups = {
				-- Telescope theming with Flexoki colors
				TelescopeNormal = { bg = "overlay", fg = "text" },
				TelescopeBorder = { bg = "overlay", fg = "muted" },
				TelescopePromptNormal = { bg = "base", fg = "text" },
				TelescopePromptBorder = { bg = "base", fg = "muted" },
				TelescopePromptTitle = { bg = "red_two", fg = "base" },
				TelescopePreviewTitle = { bg = "green_two", fg = "base" },
				TelescopeResultsTitle = { bg = "blue_two", fg = "base" },
				TelescopeSelection = { bg = "surface", fg = "subtle" },
				TelescopeSelectionCaret = { fg = "red_two" },
				TelescopeMatching = { fg = "orange_two", bold = true },
				
				-- Lualine theming with Flexoki colors
				lualine_a_normal = { bg = "surface", fg = "text", bold = true },
				lualine_b_normal = { bg = "overlay", fg = "text" },
				lualine_c_normal = { bg = "base", fg = "text" },
				lualine_a_insert = { bg = "green_two", fg = "base", bold = true },
				lualine_b_insert = { bg = "overlay", fg = "text" },
				lualine_c_insert = { bg = "base", fg = "text" },
				lualine_a_visual = { bg = "purple_two", fg = "base", bold = true },
				lualine_b_visual = { bg = "overlay", fg = "text" },
				lualine_c_visual = { bg = "base", fg = "text" },
				lualine_a_replace = { bg = "red_two", fg = "base", bold = true },
				lualine_b_replace = { bg = "overlay", fg = "text" },
				lualine_c_replace = { bg = "base", fg = "text" },
				lualine_a_command = { bg = "orange_two", fg = "base", bold = true },
				lualine_b_command = { bg = "overlay", fg = "text" },
				lualine_c_command = { bg = "base", fg = "text" },
				lualine_a_inactive = { bg = "base", fg = "muted", bold = true },
				lualine_b_inactive = { bg = "base", fg = "muted" },
				lualine_c_inactive = { bg = "base", fg = "muted" },
			}
		})
		vim.cmd.colorscheme("flexoki")
	end,
}
