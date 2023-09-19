local mappings = {
  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}


return {
  "folke/which-key.nvim",
  keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
  cmd = "WhichKey",
  lazy = false,

  init = function()
    require("core.utils").load_mappings("whichkey", mappings)
  end,

  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
