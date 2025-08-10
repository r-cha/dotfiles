-- Custom darker lualine theme
local colors = {
  bg       = '#1a1a1a',
  fg       = '#abb2bf',
  yellow   = '#e5c07b',
  cyan     = '#56b6c2',
  darkblue = '#081633',
  green    = '#98c379',
  orange   = '#d19a66',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#61afef',
  red      = '#e86671',
  section_bg = '#2a2a2a',
}

local theme = {
  normal = {
    a = { fg = colors.fg, bg = colors.section_bg, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.section_bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.section_bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  visual = {
    a = { fg = colors.bg, bg = colors.magenta, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.section_bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.section_bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.section_bg },
    c = { fg = colors.fg, bg = colors.bg },
  },

  inactive = {
    a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  }
}

return theme
