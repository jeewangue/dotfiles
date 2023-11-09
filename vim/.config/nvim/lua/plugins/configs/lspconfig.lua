return {
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
          'eslint',
          'golangci_lint_ls',
          'gopls',
          'gradle_ls',
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
    -- {
    --   'jay-babu/mason-null-ls.nvim',
    --   cmd = { 'NullLsInstall', 'NullLsUninstall' },
    --   dependencies = {
    --     'jose-elias-alvarez/null-ls.nvim',
    --   },
    --   opts = {
    --     ensure_installed = {
    --       'cpplint',
    --       'prettier',
    --       'shfmt',
    --       'stylua',
    --       'tfsec',
    --       'black',
    --       'jq',
    --       'blackd-client',
    --     },
    --     automatic_installation = true,
    --     handlers = {},
    --   },
    -- },
    -- {
    --   'jay-babu/mason-nvim-dap.nvim',
    --   cmd = { 'DapInstall', 'DapUninstall' },
    --   opts = {
    --     ensure_installed = {
    --       'codelldb',
    --     },
    --     automatic_installation = true,
    --     handlers = {},
    --   },
    -- },
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
    capabilities.offsetEncoding = { 'utf-16' }

    local lspconfig = require 'lspconfig'

    lspconfig.clangd.setup {
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
          schemas = require 'schemastore'.yaml.schemas(),
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = '',
          },
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

    require 'mason-lspconfig'.setup {}
  end,
}
