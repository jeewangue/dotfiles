return {
  "neovim/nvim-lspconfig",
  cmd = { "LspStart", "LspStop", "LspRestart", "LspInfo", "LspLog" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'williamboman/mason.nvim' },
  },
  config = function()
    local lsp = require "lsp-zero"

    lsp.on_attach(function(_, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp.default_keymaps({ buffer = bufnr })
    end)

    require "lspconfig".lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
  end,
}
