return {
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {
      -- https://coolors.co/palette/001219-005f73-0a9396-94d2bd-e9d8a6-ee9b00-ca6702-bb3e03-ae2012-9b2226
      RichBlack = '#001219',
      MidnightGreen = '#005f73',
      DarkCyan = '#0a9396',
      TiffanyBlue = '#94d2bd',
      Vanilla = '#e9d8a6',
      Gamboge = '#ee9b00',
      AlloyOrange = '#ca6702',
      Rust = '#bb3e03',
      Rufuos = '#ae2012',
      Auburn = '#9b2226',

      -- https://coolors.co/palette/664d00-6e2a0c-691312-5d0933-291938-042d3a-12403c-475200
      FieldDrab = '#664d00',
      SealBrown = '#6e2a0c',
      Rosewood = '#691312',
      TyrianPurple = '#5d0933',
      DarkPurple = '#291938',
      Gunmetal = '#042d3a',
      BrunswickGreen = '#12403c',
      DarkMossGreen = '#475200',
    },
    theme = {
      wave = {},
      lotus = {},
      dragon = {},
      all = {},
    },
  },
  overrides = function(colors) -- add/modify highlights
    return {
      Search = { fg = colors.palette.AlloyOrange, bg = colors.palette.RichBlack },
      CurSearch = { fg = colors.palette.AlloyOrange, bg = colors.palette.RichBlack },
      Visual = { bg = colors.palette.RichBlack },
      VisualNOS = { bg = colors.palette.RichBlack },
      Pmenu = { bg = colors.palette.RichBlack },
    }
  end,
  theme = "wave",  -- "wave" | "lotus" | "dragon"
  background = {   -- map the value of 'background' option to a theme
    dark = "wave", -- try "dragon" !
    light = "lotus"
  },
}
