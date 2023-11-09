return {
  -- -- nvim-lspconfig
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     { 'folke/neodev.nvim', lazy = true },
  --     {
  --       'williamboman/mason.nvim',
  --       cmd = 'Mason',
  --       opts = {
  --         ui = {
  --           icons = {
  --             package_installed = '',
  --             package_pending = '',
  --             package_uninstalled = '',
  --           },
  --         },
  --       },
  --     },
  --     {
  --       'williamboman/mason-lspconfig.nvim',
  --       cmd = { 'LspInstall', 'LspUninstall' },
  --       opts = {
  --         ensure_installed = {
  --           'lua_ls',
  --           'clangd',
  --           'marksman',
  --         },
  --       },
  --     },
  --     {
  --       'jay-babu/mason-null-ls.nvim',
  --       cmd = { 'NullLsInstall', 'NullLsUninstall' },
  --       opts = {
  --         ensure_installed = {
  --           'stylua',
  --           'markdownlint',
  --           'mdformat',
  --           -- 'selene',
  --           'cpplint',
  --           'clang_format',
  --           'beautysh',
  --         },
  --       },
  --     },
  --     {
  --       'jay-babu/mason-nvim-dap.nvim',
  --       cmd = { 'DapInstall', 'DapUninstall' },
  --       opts = {
  --         automatic_installation = true,
  --         handlers = {},
  --         ensure_installed = { 'codelldb' },
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       'gd',
  --       function()
  --         return require('telescope.builtin').lsp_definitions()
  --       end,
  --       desc = 'Goto Definition',
  --     },
  --     {
  --       'gr',
  --       function()
  --         return require('telescope.builtin').lsp_references()
  --       end,
  --       desc = 'References',
  --     },
  --     {
  --       'gi',
  --       function()
  --         return require('telescope.builtin').lsp_implementations()
  --       end,
  --       desc = 'Goto Implementation',
  --     },
  --     {
  --       'gy',
  --       function()
  --         return require('telescope.builtin').lsp_type_definitions()
  --       end,
  --       desc = 'Goto T[y]pe Definition',
  --     },
  --     { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
  --     { 'K', vim.lsp.buf.hover, desc = 'Hover' },
  --     { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
  --     { 'gR', vim.lsp.buf.rename, desc = 'Rename' },
  --   },
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     local lspconfig = require('lspconfig')
  --     local navic = require('nvim-navic')
  --     local on_attach = function(client, bufnr)
  --       if client.server_capabilities.documentSymbolProvider then
  --         navic.attach(client, bufnr)
  --       end
  --     end
  --     -- Load neodev.nvim before loading everything else
  --     require('neodev').setup()
  --     lspconfig.clangd.setup({
  --       -- Fix clangd offset encoding
  --       capabilities = { offsetEncoding = { 'utf-16' } },
  --       on_attach = on_attach,
  --     })
  --     lspconfig.lua_ls.setup({ on_attach = on_attach, log_level = 0 })
  --     lspconfig.marksman.setup({ on_attach = on_attach })
  --   end,
  -- },
  --
  -- nvim-navic
  {
    'SmiteshP/nvim-navic',
    event = 'LspAttach',
    opts = {
      highlight = true,
      lsp = {
        auto_attach = true,
      },
      icons = {
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
      },
    },
  },

  -- conform.nvim
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fm',
        function()
          require 'conform'.format { async = true, lsp_fallback = true }
        end,
        desc = 'Format with Conform',
      },
    },
    opts = {
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black', 'ruff' },
        -- Use a sub-list to run only the first available formatter
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        rust = { 'rustfmt' },
        sh = { 'shfmt' },
        toml = { 'taplo' },
        -- dockerfile = { 'hadolint' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
        -- hadolint = {
        --   command = 'hadolint',
        --   args = { '--no-fail', '--format', 'json', '$FILENAME' },
        -- },
      },
      -- format_on_save = {
      --   -- These options will be passed to conform.format()
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
    },
    config = true,
  },
  --
  -- -- null-ls.nvim
  -- -- WARNING: null-ls.nvim will be archived on August 11, 2023
  -- -- Find a suitable replacement soon
  -- -- Related: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621
  -- -- NOTE: Look into alternatives
  -- -- Related: https://github.com/mhartington/formatter.nvim and https://github.com/mfussenegger/nvim-lint
  -- -- NOTE: mason-tools-installer.nvim seems to work for installing the tools I need, but doesn't seem to work properly.
  -- -- Keep looking into this, maybe it's a config error on my end?
  -- -- Related: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  -- {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   dependencies = { 'williamboman/mason.nvim', 'nvim-lua/plenary.nvim' },
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   opts = function()
  --     local nls = require('null-ls')
  --     local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
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
  --       on_attach = function(client, bufnr)
  --         -- Autoformat on save if supported
  --         if client.supports_method('textDocument/formatting') then
  --           vim.api.nvim_clear_autocmds({
  --             group = augroup,
  --             buffer = bufnr,
  --           })
  --           vim.api.nvim_create_autocmd('BufWritePre', {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --               vim.lsp.buf.format({
  --                 bufnr = bufnr,
  --                 -- I don't really like the style of lua_ls's formatting, so I exclude it and instead use stylua
  --                 ---@diagnostic disable-next-line: redefined-local
  --                 filter = function(client)
  --                   return client.name ~= 'lua_ls'
  --                 end,
  --               })
  --             end,
  --           })
  --         end
  --       end,
  --     }
  --   end,
  -- },

  -- fidget.nvim
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    -- NOTE: Keep branch option until further notice
    -- Related: https://github.com/j-hui/fidget.nvim/commit/a6c51e2
    -- Also related: https://github.com/j-hui/fidget.nvim/issues/131
    branch = 'legacy',
    opts = {
      window = {
        blend = 0,
        relative = 'editor'
      },
      text = { spinner = 'dots' }
    },
  },


  -- lsp_lines.nvim
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    config = true
  },

  -- actions-preview.nvim
  {
    'aznhe21/actions-preview.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    event = 'LspAttach',
    keys = {
      {
        'gf',
        function()
          require 'actions-preview'.code_actions()
        end,
        mode = { 'n', 'v' },
        desc = 'Open actions-preview.nvim',
      },
    },
    opts = {
      diff = {
        algorithm = 'patience',
      },
      telescope = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },
  --
  -- -- nvim-lightbulb
  -- { 'kosayoda/nvim-lightbulb', event = 'LspAttach', opts = { autocmd = { enabled = true } } },
  --
  -- -- nvim-dap
  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     -- Virtual text for nvim-dap
  --     { 'theHamsta/nvim-dap-virtual-text', config = true },
  --
  --     -- UI for nvim-dap
  --     {
  --       'rcarriga/nvim-dap-ui',
  --       keys = {
  --         {
  --           '<leader>du',
  --           function()
  --             return require('dapui').toggle()
  --           end,
  --           desc = 'Dap UI',
  --         },
  --         {
  --           '<leader>de',
  --           function()
  --             return require('dapui').eval()
  --           end,
  --           desc = 'Eval',
  --           mode = { 'n', 'v' },
  --         },
  --       },
  --       config = function()
  --         local dap = require('dap')
  --         local dapui = require('dapui')
  --         dapui.setup()
  --         dap.listeners.after.event_initialized['dapui_config'] = function()
  --           dapui.open()
  --         end
  --         dap.listeners.before.event_terminated['dapui_config'] = function()
  --           dapui.close()
  --         end
  --         dap.listeners.before.event_exited['dapui_config'] = function()
  --           dapui.close()
  --         end
  --       end,
  --     },
  --   },
  --   keys = {
  --     {
  --       '<leader>dB',
  --       function()
  --         return require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
  --       end,
  --       desc = 'Breakpoint Condition',
  --     },
  --     {
  --       '<leader>db',
  --       function()
  --         return require('dap').toggle_breakpoint()
  --       end,
  --       desc = 'Toggle Breakpoint',
  --     },
  --     {
  --       '<leader>dc',
  --       function()
  --         return require('dap').continue()
  --       end,
  --       desc = 'Continue',
  --     },
  --     {
  --       '<leader>dC',
  --       function()
  --         return require('dap').run_to_cursor()
  --       end,
  --       desc = 'Run to Cursor',
  --     },
  --     {
  --       '<leader>dg',
  --       function()
  --         return require('dap').goto_()
  --       end,
  --       desc = 'Go to line (no execute)',
  --     },
  --     {
  --       '<leader>di',
  --       function()
  --         return require('dap').step_into()
  --       end,
  --       desc = 'Step Into',
  --     },
  --     {
  --       '<leader>dj',
  --       function()
  --         return require('dap').down()
  --       end,
  --       desc = 'Down',
  --     },
  --     {
  --       '<leader>dk',
  --       function()
  --         return require('dap').up()
  --       end,
  --       desc = 'Up',
  --     },
  --     {
  --       '<leader>dl',
  --       function()
  --         return require('dap').run_last()
  --       end,
  --       desc = 'Run Last',
  --     },
  --     {
  --       '<leader>do',
  --       function()
  --         return require('dap').step_out()
  --       end,
  --       desc = 'Step Out',
  --     },
  --     {
  --       '<leader>dO',
  --       function()
  --         return require('dap').step_over()
  --       end,
  --       desc = 'Step Over',
  --     },
  --     {
  --       '<leader>dp',
  --       function()
  --         return require('dap').pause()
  --       end,
  --       desc = 'Pause',
  --     },
  --     {
  --       '<leader>dr',
  --       function()
  --         return require('dap').repl.toggle()
  --       end,
  --       desc = 'Toggle REPL',
  --     },
  --     {
  --       '<leader>ds',
  --       function()
  --         return require('dap').session()
  --       end,
  --       desc = 'Session',
  --     },
  --     {
  --       '<leader>dt',
  --       function()
  --         return require('dap').terminate()
  --       end,
  --       desc = 'Terminate',
  --     },
  --     {
  --       '<leader>dw',
  --       function()
  --         return require('dap.ui.widgets').hover()
  --       end,
  --       desc = 'Widgets',
  --     },
  --   },
  --   config = function()
  --     vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
  --   end,
  -- },
}
