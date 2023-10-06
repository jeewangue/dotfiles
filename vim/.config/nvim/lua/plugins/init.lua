return {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  require 'plugins.configs.kanagawa',
  require 'plugins.configs.nvim-highlight-colors',
  require 'plugins.configs.lualine',

  require 'plugins.configs.dressing',
  require 'plugins.configs.gitsigns',
  require 'plugins.configs.indent-blankline',
  require 'plugins.configs.nvim-treesitter',
  require 'plugins.configs.telescope-fzf-native',
  require 'plugins.configs.telescope-undo',
  require 'plugins.configs.telescope',
  require 'plugins.configs.neo-tree',
  require 'plugins.configs.fterm',

  -- lsp stuff
  require 'plugins.configs.lspconfig',
  { 'rcarriga/nvim-notify', lazy = false },

  -- null-ls.nvim
  -- WARNING: null-ls.nvim will be archived on August 11, 2023
  -- Find a suitable replacement soon
  -- Related: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621
  -- NOTE: Look into alternatives
  -- Related: https://github.com/mhartington/formatter.nvim and https://github.com/mfussenegger/nvim-lint
  -- NOTE: mason-tools-installer.nvim seems to work for installing the tools I need, but doesn't seem to work properly.
  -- Keep looking into this, maybe it's a config error on my end?
  -- Related: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'williamboman/mason.nvim', 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local nls = require 'null-ls'
      return {
        sources = {
          nls.builtins.formatting.stylua,
          -- nls.builtins.formatting.markdownlint,
          nls.builtins.formatting.mdformat,
          nls.builtins.formatting.clang_format,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.cpplint,
          nls.builtins.formatting.beautysh,
        },
      }
    end,
  },

  -- require("plugins.configs.nvim-code-action-menu"),
  -- require "plugins.configs.lspsaga",
  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'LspAttach',
    config = function()
      require 'lsp-inlayhints'.setup {}
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require 'lsp_lines'.setup()
    end,
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
  --   'romgrk/barbar.nvim',
  --   dependencies = {
  --     'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
  --     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  --   },
  --   init = function()
  --     vim.g.barbar_auto_setup = false
  --   end,
  --   config = function()
  --     require 'barbar'.setup {
  --       tabpages = true,
  --       icons = {
  --         preset = 'slanted',
  --         diagnostics = {
  --           [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
  --           [vim.diagnostic.severity.WARN] = { enabled = false },
  --           [vim.diagnostic.severity.INFO] = { enabled = false },
  --           [vim.diagnostic.severity.HINT] = { enabled = true },
  --         },
  --         gitsigns = {
  --           added = { enabled = true, icon = '+' },
  --           changed = { enabled = true, icon = '~' },
  --           deleted = { enabled = true, icon = '-' },
  --         },
  --         pinned = { filename = true },
  --       },
  --     }
  --
  --     local map = vim.api.nvim_set_keymap
  --     local opts = { noremap = true, silent = true }
  --
  --     -- Move to previous/next
  --     map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
  --     map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
  --     -- Re-order to previous/next
  --     map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
  --     map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
  --     -- Goto buffer in position...
  --     map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
  --     map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
  --     map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
  --     map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
  --     map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
  --     map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
  --     map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
  --     map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
  --     map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
  --     map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
  --     -- Pin/unpin buffer
  --     map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
  --     -- Close buffer
  --     map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
  --     -- Wipeout buffer
  --     --                 :BufferWipeout
  --     -- Close commands
  --     --                 :BufferCloseAllButCurrent
  --     --                 :BufferCloseAllButPinned
  --     --                 :BufferCloseAllButCurrentOrPinned
  --     --                 :BufferCloseBuffersLeft
  --     --                 :BufferCloseBuffersRight
  --     -- Magic buffer-picking mode
  --     map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  --   end,
  -- },

  -- Only load whichkey after all the gui
  require 'plugins.configs.which-key',
}
