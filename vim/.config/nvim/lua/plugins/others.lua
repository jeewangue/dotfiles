return {
  -- lsp stuff
  require 'plugins.configs.lspconfig',

  -- require("plugins.configs.nvim-code-action-menu"),
  -- require "plugins.configs.lspsaga",
  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'LspAttach',
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
