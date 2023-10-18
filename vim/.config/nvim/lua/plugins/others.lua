return {
  require 'plugins.configs.nvim-treesitter',

  -- lsp stuff
  require 'plugins.configs.lspconfig',

  -- null-ls.nvim
  -- WARNING: null-ls.nvim will be archived on August 11, 2023
  -- Find a suitable replacement soon
  -- Related: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621
  -- NOTE: Look into alternatives
  -- Related: https://github.com/mhartington/formatter.nvim and https://github.com/mfussenegger/nvim-lint
  -- NOTE: mason-tools-installer.nvim seems to work for installing the tools I need, but doesn't seem to work properly.
  -- Keep looking into this, maybe it's a config error on my end?
  -- Related: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  -- {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   dependencies = { 'williamboman/mason.nvim', 'nvim-lua/plenary.nvim' },
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   opts = function()
  --     local nls = require 'null-ls'
  --     return {
  --       sources = {
  --         nls.builtins.formatting.stylua,
  --         -- nls.builtins.formatting.markdownlint,
  --         nls.builtins.formatting.mdformat,
  --         nls.builtins.formatting.clang_format,
  --         nls.builtins.diagnostics.markdownlint,
  --         nls.builtins.diagnostics.cpplint,
  --         nls.builtins.formatting.beautysh,
  --       },
  --     }
  --   end,
  -- },

  -- require("plugins.configs.nvim-code-action-menu"),
  -- require "plugins.configs.lspsaga",
  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'LspAttach',
    config = true,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = true,
  },
  -- {
  --   'ray-x/navigator.lua',
  --   event = 'LspAttach',
  --   dependencies = {
  --     { 'neovim/nvim-lspconfig' },
  --     { 'ray-x/guihua.lua',               run = 'cd lua/fzy && make' },
  --     { 'ray-x/lsp_signature.nvim' },
  --     { 'nvim-treesitter/nvim-treesitter' },
  --   },
  --   config = function()
  --     require 'navigator'.setup {
  --       mason = true,
  --       default_mapping = false,
  --       lsp_signature_help = true,
  --     }
  --   end,
  -- },
  -- {
  --   'edluffy/hologram.nvim',
  --   opts = {
  --     auto_display = true,
  --   },
  -- },
  -- {
  --   '3rd/image.nvim',
  --   ft = { 'markdown', 'norg', 'syslang', 'vimwiki' },
  --   opts = {
  --     backend = 'ueberzug',
  --   },
  --   rocks = { 'magick' },
  -- },

  -- TODO: neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'neorg'.setup {
        load = {
          ['core.defaults'] = {},  -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
              },
            },
          },
        },
      }
    end,
  },
}
