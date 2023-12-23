return {
  -- nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspStart', 'LspStop', 'LspRestart', 'LspInfo', 'LspLog' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'folke/neodev.nvim' },
      { 'hrsh7th/nvim-cmp' },
      {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
        opts = {
          PATH = 'prepend',

          ui = {
            icons = {
              package_pending = ' ',
              package_installed = '󰄳 ',
              package_uninstalled = ' 󰚌',
            },
          },
          max_concurrent_installers = 10,
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        cmd = { 'LspInstall', 'LspUninstall' },
        opts = {
          ensure_installed = {
            -- lsp servers
            'asm_lsp',
            'bashls',
            'biome',
            'clangd',
            'cmake',
            'cssls',
            'denols',
            'dockerls',
            'efm',
            'eslint',
            'golangci_lint_ls',
            'gopls',
            'gradle_ls',
            'grammarly',
            'graphql',
            'helm_ls',
            'html',
            'jdtls', -- java
            'jqls',
            'jsonls',
            'lua_ls',
            'marksman',
            'neocmake',
            'perlnavigator',
            'pyright',
            'ruff_lsp',
            'rust_analyzer',
            'solargraph',
            'solc',
            'solidity',
            'sqlls',
            'taplo',
            'terraformls',
            'texlab',
            'tflint',
            'tsserver',
            'vimls',
            'yamlls',
            'zk',
            'zls',
          },
        },
      },
      { 'b0o/schemastore.nvim' },
    },
    keys = {
      {
        'gd',
        function()
          return require 'telescope.builtin'.lsp_definitions()
        end,
        desc = 'Goto Definition',
      },
      {
        'gr',
        function()
          return require 'telescope.builtin'.lsp_references()
        end,
        desc = 'References',
      },
      {
        'gR',
        function()
          return vim.lsp.buf.rename()
        end,
        desc = 'Rename',
      },
      {
        'gD',
        vim.lsp.buf.declaration,
        desc = 'Goto Declaration',
      },
      {
        'gI',
        function()
          return require 'telescope.builtin'.lsp_implementations()
        end,
        desc = 'Goto Implementation',
      },
      {
        'gy',
        function()
          return require 'telescope.builtin'.lsp_type_definitions()
        end,
        desc = 'Goto T[y]pe Definition',
      },
      { 'K',  vim.lsp.buf.hover,          desc = 'Hover' },
      { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
      capabilities.offsetEncoding = { 'utf-16' }

      local lspconfig = require 'lspconfig'

      lspconfig.clangd.setup {
        capabilities = capabilities,
      }

      lspconfig.taplo.setup {
        capabilities = capabilities,
      }

      lspconfig.terraformls.setup {
        capabilities = capabilities,
        cmd = { 'terraform-ls', 'serve' },
        filetypes = { 'tf', 'terraform', 'terraform-vars' },
        root_dir = lspconfig.util.root_pattern('.terraform', '.git'),
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
              Lua = {
                runtime = {
                  version = 'LuaJIT',
                },
                diagnostics = {
                  enable = true,
                  globals = {
                    'vim',
                    'describe',
                    'it',
                    'before_each',
                    'after_each',
                    'teardown',
                    'pending',
                    'lfs',
                  },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false,
                  maxPreload = 2000,
                  preloadFileSize = 1000,
                },
                hint = {
                  enable = true,
                },
              },
            })

            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
          end
          return true
        end,
      }

      lspconfig.bashls.setup {
        capabilities = capabilities,
      }


      lspconfig.jsonls.setup {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require 'schemastore'.json.schemas(),
            validate = { enable = true },
          },
        },
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = vim.tbl_deep_extend('force',
              require 'schemastore'.yaml.schemas(),
              {
                ['https://raw.githubusercontent.com/jeewangue/kubernetes-json-schema/master/v1.28.3-standalone-strict/all.json'] = '*.k8s.yaml',

              }
            ),
            schemaStore = {
              enable = false,
              url = '',
            },
            format = {
              enable = true,
              format = {
                printWidth = 160,
              },
            },
            hover = true,
            completion = true,
            validate = true,

          },
        },
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
      }

      lspconfig.ruff_lsp.setup {
        capabilities = capabilities,
      }

      lspconfig.marksman.setup {
        capabilities = capabilities,
      }

      lspconfig.eslint.setup {
        capabilities = capabilities,
      }

      lspconfig.solargraph.setup {
        cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
      }


      lspconfig.efm.setup {
        capabilities = capabilities,
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
          hover = true,
          documentSymbol = true,
          codeAction = true,
          completion = true
        },
        filetypes = { 'cfn', 'yaml' },
        settings = {
          log_level = 1,
          rootMarkers = { '.git/' },
          languages = {
            cfn = {
              {
                lintCommand = 'cfn-lint -f parseable',
                lintStdin = false,
                lintIgnoreExitCode = true,
                lintFormats = { '%f:%l:%c:%e:%k:%t%n:%m' },
              }
            },
            yaml = {
              {
                lintCommand =
                'yamllint -f parsable -d "{extends: default, rules: {line-length: disable, comments-indentation: disable, document-start: disable}}" -',
                lintStdin = true,
                lintIgnoreExitCode = true,
                lintFormats = { '%f:%l:%c: %m' },
                formatCommand = 'prettier --parser yaml',
                formatStdin = true
              }
            },
          }
        },
        single_file_support = true,
      }

      lspconfig.cmake.setup {
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
          client.server_capabilities.documentSymbolProvider = false
        end,
      }

      lspconfig.neocmake.setup {
        capabilities = capabilities,
      }

      lspconfig.dockerls.setup {
        capabilities = capabilities,
      }

      require 'mason-lspconfig'.setup {}
    end,
  },

  -- lsp-inlayhints.nvim
  {
    'lvimuser/lsp-inlayhints.nvim',
    event = 'LspAttach',
    config = true,
  },

  -- nvim-navic
  {
    'SmiteshP/nvim-navic',
    event = 'LspAttach',
    opts = {
      highlight = true,
      lsp = {
        auto_attach = true,
        preference = {
          'yamlls', 'jsonls', 'tsserver', 'pyright', 'rust_analyzer', 'clangd', 'gopls', 'bashls'
        },
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

  -- mfussenegger/nvim-lint
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        python = { 'mypy' },
        sh = { 'shellcheck' },
        markdown = { 'markdownlint' },
        json = { 'jsonlint' },
        dockerfile = { 'hadolint' },
      }

      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        callback = function()
          require 'lint'.try_lint()
        end,
      })

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require 'lint'.try_lint()
        end,
      })
    end,
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
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        rust = { 'rustfmt' },
        sh = { 'shfmt' },
        toml = { 'taplo' },
        markdown = { 'prettier' },
        pandoc = { 'prettier' },
        xml = { 'xmlformat' },
        json = { 'prettier' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
      },
    },
    config = true,
  },

  -- ThePrimeagen/refactoring.nvim
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>rr',
        function()
          require 'telescope'.extensions.refactoring.refactors()
        end,
        mode = { 'n', 'x' },
      }
    },
    config = function()
      require 'refactoring'.setup()
      require 'telescope'.load_extension 'refactoring'
    end,
  },

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

  -- rust-tools.nvim
  {
    'simrat39/rust-tools.nvim',
    event = 'BufReadPre',
    ft = { 'rust' },
    config = function()
      require 'rust-tools'.setup {
        tools = {
          autoSetHints = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = '<- ',
            other_hints_prefix = '=> ',
            highlight = 'MyInlayHint',
          },
        },
      }
    end,
  },

  -- nvim-dap
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- nvim-dap-virtual-text
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = { highlight_new_as_changed = true }
      },

      -- mason-nvim-dap.nvim
      {
        'jay-babu/mason-nvim-dap.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        dependencies = 'williamboman/mason.nvim',
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = { 'codelldb' },
        },
      },

      -- goto-breakpoints.nvim
      {
        'ofirgall/goto-breakpoints.nvim',
        keys = {
          -- stylua: ignore start
          { ']b', function() return require 'goto-breakpoints'.next() end, desc = 'Next breakpoint' },
          { '[b', function() return require 'goto-breakpoints'.prev() end, desc = 'Previous breakpoint' },
          -- stylua: ignore end
        },
      },

      -- nvim-dap-ui
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          -- stylua: ignore start
          { '<leader>du', function() return require 'dapui'.toggle() end, desc = 'Dap UI' },
          { '<leader>de', function() return require 'dapui'.eval() end,   desc = 'Eval',  mode = { 'n', 'v' } },
          -- stylua: ignore end
        },
        config = function()
          local dap = require 'dap'
          local dapui = require 'dapui'
          dapui.setup()
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },
    },
    keys = {
      {
        '<leader>dB',
        function() return require 'dap'.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        desc = 'Breakpoint Condition'
      },
      {
        '<leader>db',
        function() return require 'dap'.toggle_breakpoint() end,
        desc = 'Toggle Breakpoint'
      },
      {
        '<leader>dc',
        function() return require 'dap'.continue() end,
        desc = 'Continue'
      },
      {
        '<leader>dC',
        function() return require 'dap'.run_to_cursor() end,
        desc = 'Run to Cursor'
      },
      {
        '<leader>dg',
        function() return require 'dap'.goto_() end,
        desc = 'Go to line (no execute)'
      },
      {
        '<leader>di',
        function() return require 'dap'.step_into() end,
        desc = 'Step Into'
      },
      {
        '<leader>dj',
        function() return require 'dap'.down() end,
        desc = 'Down'
      },
      {
        '<leader>dk',
        function() return require 'dap'.up() end,
        desc = 'Up'
      },
      {
        '<leader>dl',
        function() return require 'dap'.run_last() end,
        desc = 'Run Last'
      },
      {
        '<leader>dO',
        function() return require 'dap'.step_out() end,
        desc = 'Step Out'
      },
      {
        '<leader>do',
        function() return require 'dap'.step_over() end,
        desc = 'Step Over'
      },
      {
        '<leader>dp',
        function() return require 'dap'.pause() end,
        desc = 'Pause'
      },
      {
        '<leader>dr',
        function() return require 'dap'.repl.toggle() end,
        desc = 'Toggle REPL'
      },
      {
        '<leader>ds',
        function() return require 'dap'.session() end,
        desc = 'Session'
      },
      {
        '<leader>dt',
        function() return require 'dap'.terminate() end,
        desc = 'Terminate'
      },
      {
        '<leader>dw',
        function() return require 'dap.ui.widgets'.hover() end,
        desc = 'Widgets'
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
    end,
  },

}
