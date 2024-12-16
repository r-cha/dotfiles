return {
    "shatur/neovim-ayu",
    config = function()
        local colors = require('ayu.colors')
        colors.generate(true)
        require('ayu').setup({
            mirage = true,
            overrides = {
                LineNr = { fg = colors.comment },
                SpecialKey = { fg = colors.special },
                Normal = { bg = "None" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                WhichKeyFloat = { bg = "None" },
                VertSplit = { bg = "None" },
            },
        })

        vim.cmd.colorscheme 'ayu'
    end,
}
