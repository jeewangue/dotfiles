local mappings = {
  n = {
    ["<leader>test"] = {
      function()
        vim.ui.select({ 'apple', 'banana', 'mango' }, {
          prompt = "Title",
          telescope = require("telescope.themes").get_cursor(),
        }, function(selected)
          vim.notify("Selected: " .. selected)
        end)
      end,
      "Test",
    },
  },
}

return {
  'stevearc/dressing.nvim',
  lazy = false,
  init = function()
    require("core.utils").load_mappings("dressing", mappings)
  end,
  opts = {},
}
