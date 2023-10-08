return {
  -- kanagawa.nvim
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'kanagawa'.setup {
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
            IncSearch = { fg = colors.palette.AlloyOrange, bg = colors.palette.RichBlack },
            CurSearch = { fg = colors.palette.AlloyOrange, bg = colors.palette.RichBlack },
            Visual = { bg = colors.palette.RichBlack },
            VisualNOS = { bg = colors.palette.RichBlack },
            Pmenu = { bg = colors.palette.RichBlack },
            IndentBlanklineContextChar = { fg = colors.palette.Rust, bold = true },
            CopilotSuggestion = { fg = 'khaki1', bg = colors.palette.RichBlack },
            IlluminatedWordText = { bg = colors.palette.Rosewood },
            IlluminatedWordRead = { bg = colors.palette.Rosewood },
            IlluminatedWordWrite = { bg = colors.palette.Rosewood },
          }
        end,
        theme = 'wave',  -- "wave" | "lotus" | "dragon"
        background = {   -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }
      vim.cmd [[colorscheme kanagawa]]
    end,
  },

  -- -- tokyonight.nvim
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = 'night',
  --     transparent = true,
  --     lualine_bold = true,
  --     terminal_colors = true,
  --     on_highlights = function(hl, c)
  --       local prompt = '#2d3149'
  --       hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  --       hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  --       hl.TelescopePromptNormal = { bg = prompt }
  --       hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  --       hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
  --       hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --       hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --     end,
  --   },
  --   config = function(_, opts)
  --     local tokyonight = require('tokyonight')
  --     tokyonight.setup(opts)
  --     tokyonight.load()
  --   end,
  -- },

  -- nvim-notify
  {
    'rcarriga/nvim-notify',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      local notify = require 'notify'
      ---@diagnostic disable-next-line: undefined-field
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  -- dressing.nvim
  {
    'stevearc/dressing.nvim',
    config = true,
  },

  -- nvim-highlight-colors
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require 'nvim-highlight-colors'.setup {}
    end,
  },

  -- nvim-ufo
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      {
        'zR',
        function()
          return require 'ufo'.openAllFolds()
        end,
        desc = 'Open all folds',
      },
      {
        'zM',
        function()
          return require 'ufo'.closeAllFolds()
        end,
        desc = 'Close all folds',
      },
    },
    opts = {
      provider_selector = function(_, filetype, buftype)
        return (filetype == '' or buftype == 'nofile') and 'indent' or { 'treesitter', 'indent' }
      end,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d lines'):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end,
    },
  },

  -- indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      indentLine_enabled = 1,
      filetype_exclude = {
        'help',
        'terminal',
        'lazy',
        'neo-tree',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'mason',
        '',
      },
      buftype_exclude = { 'terminal' },
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      show_current_context = true,
      show_current_context_start = true,
    },
  },

  -- lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      options = {
        disabled_filetypes = {
          'mason',
          'dashboard',
          'NeogitStatus',
          'NeogitCommitView',
          'NeogitPopup',
          'NeogitConsole',
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icons_enabled = true,
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          'branch',
          'diff',
          'diagnostics',
        },
        lualine_c = { 'filename', { 'navic', color_correction = 'static' } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'searchcount', 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {
          'diff',
          'diagnostics',
        },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        'man',
        'toggleterm',
        'neo-tree',
        'trouble',
        'lazy',
        'nvim-dap-ui',
      },
    },
  },

  -- which-key.nvim
  {
    'folke/which-key.nvim',
    cmd = 'WhichKey',
    keys = {
      '<leader>',
      '"',
      "'",
      '`',
      'c',
      'v',
      'y',
      'd',
      'z',
      'g',
      {
        '<leader>wk',
        function()
          vim.cmd 'WhichKey'
        end,
        mode = 'n',
        desc = 'Which-key all keymaps',
      },
    },
    opts = {
      operators = { gc = 'Comments', gb = 'Block comments' },
      defaults = {
        mode = { 'n', 'v' },
        ['g'] = { name = '+goto' },
        ['gc'] = { name = '+comments' },
        ['gb'] = { name = '+block comments' },
        [']'] = { name = '+next' },
        ['['] = { name = '+prev' },
        ['<leader>q'] = { name = '+quit/session' },
        ['<leader>f'] = { name = '+find' },
        ['<leader>b'] = { name = '+buffers' },
        ['<leader>g'] = { name = '+git' },
        ['<leader>x'] = { name = '+diagnostics/quickfix' },
        ['<leader>d'] = { name = '+debugger' },
      },
    },
    config = function(_, opts)
      local wk = require 'which-key'
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
