return {
  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comments' },
      { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comments' },
    },
    opts = {
      mappings = {
        basic = true,
        extra = false,
      },
    },
  },

  -- Copilot
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require 'copilot'.setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom', -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<M-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      }
    end,
  },

  -- nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'FelipeLema/cmp-async-path',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
        version = 'v2.*',
        config = true,
        keys = {
          {
            '<C-j>',
            function()
              local ls = require 'luasnip'
              if ls.expand_or_jumpable() then
                ls.expand_or_jump()
              end
            end,
            mode = { 'i', 's' },
            silent = true,
          },
          {
            '<C-k>',
            function()
              local ls = require 'luasnip'
              if ls.jumpable(-1) then
                ls.jump(-1)
              end
            end,
            mode = { 'i', 's' },
            silent = true,
          },
        },
      },
    },
    event = 'InsertEnter',
    opts = function()
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
      local cmp = require 'cmp'
      local defaults = require 'cmp.config.default' ()
      return {
        snippet = {
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<S-CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'async_path' },
          { name = 'calc' },
          { name = 'nvim_lsp_signature_help' },
        },
        formatting = {
          format = function(entry, item)
            local icons = {
              Array = ' ',
              Boolean = ' ',
              Class = ' ',
              Color = ' ',
              Constant = ' ',
              Constructor = ' ',
              Copilot = ' ',
              Enum = ' ',
              EnumMember = ' ',
              Event = ' ',
              Field = ' ',
              File = ' ',
              Folder = ' ',
              Function = ' ',
              Interface = ' ',
              Key = ' ',
              Keyword = ' ',
              Method = ' ',
              Module = ' ',
              Namespace = ' ',
              Null = ' ',
              Number = ' ',
              Object = ' ',
              Operator = ' ',
              Package = ' ',
              Property = ' ',
              Reference = ' ',
              Snippet = ' ',
              String = ' ',
              Struct = ' ',
              Text = ' ',
              TypeParameter = ' ',
              Unit = ' ',
              Value = ' ',
              Variable = ' ',
            }
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            item.menu = ({
              nvim_lsp = '[L]',
              luasnip = '[S]',
              buffer = '[B]',
              async_path = '[P]',
              calc = '[C]',
              nvim_lsp_signature_help = '[Sig]',
            })[entry.source.name]

            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = 'CmpGhostText',
          },
        },
        sorting = defaults.sorting,
        preselect = cmp.PreselectMode.None,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
    config = function(_, opts)
      local cmp = require 'cmp'
      cmp.setup(opts)
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources { { name = 'git' }, { name = 'buffer' } },
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources { { name = 'path' }, { name = 'cmdline' } },
      })
    end,
  },
}
