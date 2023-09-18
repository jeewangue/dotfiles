return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "lua-language-server",
      "asm_lsp",
      "bashls",
      "clangd",
      "neocmake",
      "cssls",
      "dockerls",
      "eslint",
      "golangci_lint_ls",
      "gopls",
      "gradle_ls",
      "graphql",
      "html",
      "helm_ls",
      "jsonls",
      "jdtls", -- java
      "tsserver",
      "jqls",
      "lua_ls",
      "marksman",
      "perlnavigator",
      "pyright",
      "ruff_lsp",
      "solargraph",
      "rust_analyzer",
      "solc",
      "taplo",
      "terraformls",
      "tflint",
      "biome", --typescript
      "vimls",
      "yamlls",
      "zls",
    }
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
  end
}
