return {
  'nvimdev/lspsaga.nvim',
  event = "LspAttach",
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
    'weilbith/nvim-code-action-menu',
  },
  init = function()
    require "core.utils".load_mappings("lspsaga", {
      n = {
        ["<leader>ac"] = { "<CMD>CodeActionMenu<CR>", "󰅱 Code Action" },
        ["gf"] = {
          function()
            vim.cmd "Lspsaga finder"
          end,
          " Go to definition",
          {
            silent = true,
            noremap = true,
            nowait = true,
          },
        },
        ["gd"] = {
          "<CMD>Lspsaga goto_definition<CR>",
          " Go to definition",
        },
        ["<leader>lp"] = {
          "<CMD>Lspsaga peek_definition<CR>",
          " Peek definition",
        },
        ["gh"] = {
          "<CMD>Lspsaga hover_doc<CR>",
          -- function()
          --   require("pretty_hover").hover()
          -- end,
          "󱙼 Hover lsp",
        },
        ["<leader>o"] = { "<CMD>Lspsaga outline<CR>", " Show Outline" },
        --  LSP
        ["gr"] = { "<CMD>Telescope lsp_references<CR>", " Lsp references" },
        ["[d"] = { "<CMD>Lspsaga diagnostic_jump_prev<CR>", " Prev Diagnostic" },
        ["]d"] = { "<CMD>Lspsaga diagnostic_jump_next<CR>", " Next Diagnostic" },
        ["<leader>qf"] = {
          function()
            vim.diagnostic.setloclist()
          end,
          "󰁨 Lsp Quickfix",
        },
      },
    })
  end,
  config = function()
    require('lspsaga').setup({})
  end,
}
