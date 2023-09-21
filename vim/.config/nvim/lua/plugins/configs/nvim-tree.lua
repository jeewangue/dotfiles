return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  dependencies = {
    "antosha417/nvim-lsp-file-operations"
  },
  init = function()
    require "core.utils".load_mappings("nvim-tree", {
      n = {
        ["<leader>n"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
      },
    })
  end,
  config = function()
    require "nvim-tree".setup(
      {
        filters = {
          dotfiles = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          side = "left",
          width = 30,
          preserve_window_proportions = true,
        },
        git = {
          enable = true,
          ignore = true,
        },
        filesystem_watchers = {
          enable = true,
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        renderer = {
          root_folder_label = true,
          highlight_git = true,
          highlight_opened_files = "none",

          indent_markers = {
            enable = true,
          },

          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },

            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        on_attach = function(bufnr)
          local api = require "nvim-tree.api"
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "l", api.node.open.edit, { desc = "Open", buffer = bufnr, noremap = true, silent = true })
          vim.keymap.set("n", "h", api.node.navigate.parent_close,
            { desc = "Close directory", buffer = bufnr, noremap = true, silent = true })
          vim.keymap.set("n", "E", api.node.open.vertical,
            { desc = "Open: Vertical Split", buffer = bufnr, noremap = true, silent = true })
          vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, { desc = "Change directory", buffer = bufnr, noremap = true, silent = true })
          vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, { desc = "Change directory to parent", buffer = bufnr, noremap = true, silent = true })
        end,
      }
    )
  end,
}
