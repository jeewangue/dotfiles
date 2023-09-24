return {
  "neovim/nvim-lspconfig",
  cmd = { "LspStart", "LspStop", "LspRestart", "LspInfo", "LspLog" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'williamboman/mason.nvim' },
    { "b0o/schemastore.nvim" },
  },
  config = function()
    local lsp_zero = require "lsp-zero"

    lsp_zero.on_attach(function(_, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local lspconfig = require "lspconfig"

    lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require 'schemastore'.json.schemas(),
          validate = { enable = true },
        },
      },
    }


    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          schemas = require 'schemastore'.yaml.schemas(),
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = "",
          },
        },
      },
    }

    lsp_zero.setup()
    require 'mason-lspconfig'.setup({
      ensure_installed = {
        -- lsp servers
        "asm_lsp",
        "bashls",
        "biome",
        "clangd",
        "cmake",
        "cssls",
        "denols",
        "dockerls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "gradle_ls",
        "graphql",
        "helm_ls",
        "html",
        "jdtls", -- java
        "jqls",
        "jsonls",
        "lua_ls",
        "marksman",
        "neocmake",
        "perlnavigator",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "solargraph",
        "solc",
        "solidity",
        "sqlls",
        "taplo",
        "terraformls",
        "texlab",
        "tflint",
        "tsserver",
        "vimls",
        "yamlls",
        "zk",
        "zls",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })
  end,
}
