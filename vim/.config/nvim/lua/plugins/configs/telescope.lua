local mappings = {
  n = {
    -- find
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fh"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all (including hidden)" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fv"] = { "<cmd> Telescope help_tags <CR>", "Vim Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>ut"] = { "<cmd> Telescope undo <CR>", "telescope undo" },
  }
}

return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-treesitter/nvim-treesitter'
  },
  cmd = "Telescope",
  keys = { "<leader>ff", "<leader>fa", "<leader>fw", "<leader>fb", "<leader>fh", "<leader>fo", "<leader>fz",
    "<leader>gc", "<leader>gs", "<leader>ma", "<leader>ut" },
  init = function()
    require("core.utils").load_mappings("telescope", mappings)
  end,
  config = function()
    local telescope = require "telescope"
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      extensions = {
        undo = {
          diff_context_lines = 20,
          use_delta = true,
          side_by_side = true,
          -- layout_strategy = "vertical",
          -- layout_config = {
          --   preview_height = 0.8,
          -- },
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
    )
    telescope.load_extension("undo")
    telescope.load_extension("fzf")
  end,
}
