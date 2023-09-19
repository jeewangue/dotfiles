return {
  "numToStr/FTerm.nvim",
  lazy = false,
  init = function()
    require "core.utils".load_mappings("FTerm", {
      n = {
        ["<C-t>"] = {
          "<cmd>lua require('FTerm').toggle()<CR>",
          "Toggle FTerm"
        },
      },
      t = {
        ["<C-t>"] = {
          "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>",
          "Toggle FTerm"
        },
      },
    })
  end,
  config = function()
    local fterm = require("FTerm")
    fterm.setup({
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
      auto_close = true,
    })

    local gitui = fterm:new({
      ft = 'fterm_gitui', -- You can also override the default filetype, if you want
      cmd = "gitui",
      dimensions = {
        height = 0.9,
        width = 0.9
      }
    })

    -- Use this to toggle gitui in a floating terminal
    vim.keymap.set('n', '<leader>git', function()
      gitui:toggle()
    end)
  end

}
