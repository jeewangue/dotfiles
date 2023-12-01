return {
  -- diffview.nvim
  {
    'sindrets/diffview.nvim',
    keys = {
      {
        '<leader>gd',
        function()
          return require 'diffview'.open()
        end,
        desc = 'Open diffview',
      },
      {
        '<leader>gD',
        function()
          return require 'diffview'.close()
        end,
        desc = 'Close diffview',
      },
    },
  },


  -- todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      {
        ']t',
        function()
          return require 'todo-comments'.jump_next()
        end,
        desc = 'Jump to next todo comment',
      },
      {
        '[t',
        function()
          return require 'todo-comments'.jump_prev()
        end,
        desc = 'Jump to previous todo comment',
      },
      {
        '<leader>tt',
        '<CMD>TodoTelescope<CR>',
        desc = 'Search through todo comments',
      },
    },
    config = true,
  },

  -- trouble.nvim
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true,
    keys = {
      {
        '<leader>xx',
        function()
          return require 'trouble'.open()
        end,
        desc = 'Toggle trouble.nvim',
      },
      {
        '<leader>xw',
        function()
          return require 'trouble'.open 'workspace_diagnostics'
        end,
        desc = 'Open workspace diagnostics',
      },
      {
        '<leader>xd',
        function()
          return require 'trouble'.open 'document_diagnostics'
        end,
        desc = 'Open document diagnostics',
      },
      {
        '<leader>xq',
        function()
          return require 'trouble'.open 'quickfix'
        end,

        desc = 'Open quickfix',
      },
      {
        '<leader>xl',
        function()
          return require 'trouble'.open 'loclist'
        end,
        desc = 'Open location list',
      },
      {
        '<leader>xr',
        function()
          return require 'trouble'.open 'lsp_references'
        end,
        desc = 'Open lsp references',
      },
      {
        '[q',
        function()
          if require 'trouble'.is_open() then
            require 'trouble'.previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprevious)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require 'trouble'.is_open() then
            require 'trouble'.next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/quickfix item',
      },

    },
  },

  -- vim-illuminate
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      providers = { 'lsp', 'treesitter', 'regex' },
      large_file_cuttoff = 2000,
      large_file_overrides = { providers = { 'lsp' } },
      filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
        'NvimTree',
        'neo-tree',
        'TeleScopePrompt',
        'TelescopeResults',
      },
    },
    config = function(_, opts)
      require 'illuminate'.configure(opts)
      local function map(key, dir, buffer)
        vim.keymap.set('n', key, function()
          require 'illuminate'['goto_' .. dir .. '_reference'](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
      end
      map(']]', 'next')
      map('[[', 'prev')
      -- Set it after loading ftplugins
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map(']]', 'next', buffer)
          map('[[', 'prev', buffer)
        end,
      })
    end,
    keys = { { ']]', desc = 'Next Reference' }, { '[[', desc = 'Prev Reference' } },
  },

  -- nvim-hlslens
  {
    'kevinhwang91/nvim-hlslens',
    config = true,
    keys = {
      { 'n',  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
      { 'N',  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
      { '*',  [[*<Cmd>lua require('hlslens').start()<CR>]] },
      { '#',  [[#<Cmd>lua require('hlslens').start()<CR>]] },
      { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]] },
      { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]] },
    },
  },

  -- neo-tree.nvim
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        config = function()
          require 'window-picker'.setup {
            hint = 'floating-big-letter',
            selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            filter_rules = {
              autoselect_one = true,
              include_current_win = false,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'NvimTree', 'neo-tree', 'neo-tree-popup', 'notify' },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', 'quickfix' },
              },
            },
          }
        end,
      },
    },
    -- Load neo-tree.nvim if we provide a directory as an argument
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require 'lazy'.load { plugins = { 'neo-tree.nvim' } }
        end
      end
    end,
    branch = 'v3.x',
    keys = {
      { '<leader>n', '<cmd>Neotree toggle<CR>', desc = 'Toggle Neotree' },
      { '<leader>N', '<cmd>Neotree reveal<CR>', desc = 'Open Neotree with reveal' },
    },
    opts = {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = 'filesystem' },
          { source = 'buffers' },
          { source = 'git_status' },
          { source = 'document_symbols' },
        },
      },
      window = {
        width = 40,                -- applies to left and right positions
        auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
        mappings = {
          ['h'] = function(state)
            local node = state.tree:get_node()
            if state.name == 'filesystem' then
              if node.type == 'directory' and node:is_expanded() then
                require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
              else
                require 'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
              end
            elseif state.name == 'buffers' or state.name == 'git_status' then
              require 'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
            elseif state.name == 'document_symbols' then
              if node.type == 'symbol' and node:is_expanded() then
                require 'neo-tree.sources.common.commands'.toggle_node(state, node)
              else
                require 'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
              end
            end
          end,
          ['l'] = function(state)
            local node = state.tree:get_node()
            if state.name == 'filesystem' then
              if node.type == 'directory' then
                if not node:is_expanded() then
                  require 'neo-tree.sources.filesystem'.toggle_directory(state, node)
                elseif node:has_children() then
                  require 'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                end
              elseif node.type == 'file' then
                require 'neo-tree.sources.common.commands'.open_with_window_picker(state, node)
              end
            elseif state.name == 'buffers' or state.name == 'git_status' then
              require 'neo-tree.sources.common.commands'.open_with_window_picker(state, node)
            elseif state.name == 'document_symbols' then
              if node:has_children() then
                if not node:is_expanded() then
                  require 'neo-tree.sources.common.commands'.toggle_node(state, node)
                else
                  require 'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                end
              else
                require 'neo-tree.sources.document_symbols.commands'.jump_to_symbol(state, node)
              end
            end
          end,
        },
      },
      filesystem = {
        filtered_items = { visible = true, hide_dotfiles = false },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      document_symbols = {
        follow_cursor = true,
      },
    },
  },

  -- leap.nvim
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat', keys = { '.' } },
    keys = {
      { 's',  mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S',  mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
    },
    config = function(_, opts)
      local leap = require 'leap'
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },

  -- flit.nvim
  {
    'ggandor/flit.nvim',
    dependencies = 'ggandor/leap.nvim',
    opts = { labeled_modes = 'nx' },
    keys = function()
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
  },

  -- zen-mode.nvim
  {
    'folke/zen-mode.nvim',
    dependencies = {
      {
        'folke/twilight.nvim',
        keys = { { '<leader>zt', '<cmd>Twilight<CR>', desc = 'Toggle twilight.nvim' } },
        config = true,
      },
    },
    opts = {
      window = {
        width = 0.8,
      },
    },
    keys = {
      {
        '<leader>zz',
        function()
          return require 'zen-mode'.toggle()
        end,
        desc = 'Toggle zen-mode.nvim',
      },
    },
  },

  -- neogit
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    keys = {
      {
        '<leader>gg',
        function()
          return require 'neogit'.open()
        end,
        desc = 'Open neogit',
      },
      {
        '<leader>gC',
        function()
          return require 'neogit'.open { 'commit' }
        end,
        desc = 'Open neogit commit popup',
      },
    },
    opts = {
      disable_insert_on_commit = 'auto',
      kind = 'replace',
      status = { recent_commit_count = 25 },
      integrations = { telescope = true },
      auto_show_console = false,
      telescope_sorter = function()
        return require 'telescope'.extensions.fzf.native_fzf_sorter()
      end,
    },
  },

  -- gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
        callback = function()
          vim.fn.system('git -C ' .. '"' .. vim.fn.expand '%:p:h' .. '"' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
            vim.schedule(function()
              require 'lazy'.load { plugins = { 'gitsigns.nvim' } }
            end)
          end
        end,
      })
    end,
    ft = { 'gitcommit', 'diff' },
    keys = {
      {
        '<leader>gj',
        function()
          return require 'gitsigns'.next_hunk()
        end,
        desc = 'Next hunk',
      },
      {
        '<leader>gk',
        function()
          return require 'gitsigns'.prev_hunk()
        end,
        desc = 'Previous hunk',
      },
      {
        ']g',
        function()
          return require 'gitsigns'.next_hunk()
        end,
        desc = 'Next hunk',
      },
      {
        '[g',
        function()
          return require 'gitsigns'.prev_hunk()
        end,
        desc = 'Previous hunk',
      },
      {
        '<leader>gl',
        function()
          return require 'gitsigns'.blame_line()
        end,
        desc = 'Open git blame',
      },
      {
        '<leader>gp',
        function()
          return require 'gitsigns'.preview_hunk()
        end,
        desc = 'Preview the hunk',
      },
      {
        '<leader>gr',
        function()
          return require 'gitsigns'.reset_hunk()
        end,
        desc = 'Reset the hunk',
      },
      {
        '<leader>gR',
        function()
          return require 'gitsigns'.reset_buffer()
        end,
        desc = 'Reset the buffer',
      },
      {
        '<leader>gu',
        function()
          return require 'gitsigns'.undo_stage_hunk()
        end,
        desc = 'Unstage the hunk',
      },
      -- {
      --   '<leader>gd',
      --   function()
      --     return require 'gitsigns'.diffthis()
      --   end,
      --   desc = 'Open a diff',
      -- },
      {
        '<leader>gb',
        function()
          return require 'gitsigns'.blame_line()
        end,
        desc = 'gitsigns - blame line',
      },
      {
        '<leader>gtb',
        function()
          return require 'gitsigns'.toggle_current_line_blame()
        end,
        desc = 'gitsigns - toggle current line blame',
      },
      {
        '<leader>gtd',
        function()
          return require 'gitsigns'.toggle_deleted()
        end,
        desc = 'gitsigns - toggle deleted',
      },
    },
    opts = {
      signcolumn = true, -- Toggle with `:GitSigns toggle_signs`
      watch_gitdir = { interval = 1000, follow_files = true },
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 300,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    },
  },

  -- toggleterm.nvim
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      '<C-t>',
      {
        '<C-h>',
        '<CMD>wincmd h<CR>',
        mode = 't',
        desc = 'Go to left window',
      },
      {
        '<C-j>',
        '<CMD>wincmd j<CR>',
        mode = 't',
        desc = 'Go to bottom window',
      },
      {
        '<C-k>',
        '<CMD>wincmd k<CR>',
        mode = 't',
        desc = 'Go to top window',
      },
      {
        '<C-l>',
        '<CMD>wincmd l<CR>',
        mode = 't',
        desc = 'Go to right window',
      },
      {
        '<C-w>',
        '<C-\\><C-n><C-w>',
        mode = 't',
        desc = 'Window navigation',
      },
    },
    opts = {
      open_mapping = '<C-t>',
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true,
      shell = vim.o.shell,
      shade_terminals = true,
      shading_factor = 2,
      persist_size = true,
      start_in_insert = true,
      direction = 'horizontal',
      close_on_exit = true,
      float_opts = { border = 'curved' },
    },
  },

  -- bufdelete.nvim
  {
    'famiu/bufdelete.nvim',
    keys = {
      {
        '<leader>bk',
        function()
          return require 'bufdelete'.bufdelete(0, false)
        end,
        desc = 'Delete the current buffer',
      },
      {
        '<leader>bK',
        function()
          return require 'bufdelete'.bufdelete(0, true)
        end,
        desc = 'Delete the current buffer forcefully',
      },
    },
  },

  -- BufOnly.nvim
  {
    'numToStr/BufOnly.nvim',
    keys = {
      { '<leader>bo', '<cmd>BufOnly<CR>', desc = 'Delete all other buffers' },
    },
  },

  -- highlight-undo.nvim
  {
    'tzachar/highlight-undo.nvim',
    keys = { 'u', '<C-r>' },
    config = true,
  },

  -- undotree
  {
    'mbbill/undotree',
    lazy = false,
    keys = {
      { '<leader>ut', '<cmd>UndotreeToggle<CR>', desc = 'Toggle undotree' },
    },
  },

  -- bufferline.nvim
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    event = 'UIEnter',
    keys = {
      { '<A-,>', '<CMD>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
      { '<A-.>', '<CMD>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
      {
        '<A-1>',
        function()
          return require 'bufferline'.go_to(1, true)
        end,
        desc = 'Jump to first buffer',
      },
      {
        '<A-2>',
        function()
          return require 'bufferline'.go_to(2, true)
        end,
        desc = 'Jump to second buffer',
      },
      {
        '<A-3>',
        function()
          return require 'bufferline'.go_to(3, true)
        end,
        desc = 'Jump to third buffer',
      },
      {
        '<A-4>',
        function()
          return require 'bufferline'.go_to(4, true)
        end,
        desc = 'Jump to fourth buffer',
      },
      {
        '<A-5>',
        function()
          return require 'bufferline'.go_to(5, true)
        end,
        desc = 'Jump to fifth buffer',
      },
      {
        '<A-6>',
        function()
          return require 'bufferline'.go_to(6, true)
        end,
        desc = 'Jump to sixth buffer',
      },
      {
        '<A-7>',
        function()
          return require 'bufferline'.go_to(7, true)
        end,
        desc = 'Jump to seventh buffer',
      },
      {
        '<A-8>',
        function()
          return require 'bufferline'.go_to(8, true)
        end,
        desc = 'Jump to eighth buffer',
      },
      {
        '<A-9>',
        function()
          return require 'bufferline'.go_to(9, true)
        end,
        desc = 'Jump to ninth buffer',
      },
      {
        '<A-0>',
        function()
          return require 'bufferline'.go_to(-1, true)
        end,
        desc = 'Jump to last buffer',
      },
      {
        '<A-p>',
        '<CMD>BufferLinePick<CR>',
        desc = 'Pick a buffer',
      },
    },
    opts = {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'center',
          },
        },
      },
    },
  },

  -- telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require 'telescope'.load_extension 'fzf'
        end,
      },
      -- TODO: configure ueberzerg to show image
    },
    branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
      {
        '<leader><leader>',
        function()
          return require 'telescope.builtin'.find_files()
        end,
        desc = 'Files',
      },
      {
        '<leader>ff',
        function()
          return require 'telescope.builtin'.find_files()
        end,
        desc = 'Files',
      },
      {
        '<leader>fa',
        function()
          return require 'telescope.builtin'.find_files {
            follow = true,
            no_ignore = true,
            hidden = true,
          }
        end,
        desc = 'Files (including hidden files)',
      },
      {
        '<leader>fw',
        function()
          return require 'telescope.builtin'.live_grep()
        end,
        desc = 'Words',
      },
      {
        '<leader>fb',
        function()
          return require 'telescope.builtin'.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>fh',
        function()
          return require 'telescope.builtin'.help_tags()
        end,
        desc = 'Help',
      },
      {
        '<leader>fM',
        function()
          return require 'telescope.builtin'.man_pages()
        end,
        desc = 'Man pages',
      },
      {
        '<leader>fr',
        function()
          return require 'telescope.builtin'.oldfiles()
        end,
        desc = 'Recently opened',
      },
      {
        '<leader>fR',
        function()
          return require 'telescope.builtin'.registers()
        end,
        desc = 'Registers',
      },
      {
        '<leader>fk',
        function()
          return require 'telescope.builtin'.keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>fco',
        function()
          return require 'telescope.builtin'.commands()
        end,
        desc = 'Commands',
      },
      {
        '<leader>fl',
        function()
          return require 'telescope.builtin'.resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>fd',
        function()
          return require 'telescope.builtin'.diagnostics { bufnr = 0 }
        end,
        desc = 'Document diagnostics',
      },
      {
        '<leader>fD',
        function()
          return require 'telescope.builtin'.diagnostics()
        end,
        desc = 'Workspace diagnostics',
      },
      {
        '<leader>fs',
        function()
          return require 'telescope.builtin'.lsp_document_symbols()
        end,
        desc = 'Document symbols',
      },
      {
        '<leader>gs',
        function()
          return require 'telescope.builtin'.git_status()
        end,
        desc = 'Seach through changed files',
      },
      {
        '<leader>gB',
        function()
          return require 'telescope.builtin'.git_branches()
        end,
        desc = 'Search through git branches',
      },
      {
        '<leader>gc',
        function()
          return require 'telescope.builtin'.git_commits()
        end,
        desc = 'Search and checkout git commits',
      },
      {
        '<leader>fz',
        function()
          return require 'telescope.builtin'.current_buffer_fuzzy_find()
        end,
        desc = 'Find in current buffer',
      },
      {
        '<leader>ft',
        '<cmd>TodoTelescope<CR>',
        desc = 'Todo comments',
      },
    },
    config = function()
      require 'telescope'.setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--follow',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--trim',
          },
          prompt_prefix = '   ',
          path_display = { 'smart' },
          file_ignore_patterns = { '.git/' },
          layout_strategy = 'horizontal',
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          mappings = {
            n = { ['q'] = require 'telescope.actions'.close },
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ['<C-h>'] = 'which_key',
              ['<esc>'] = require 'telescope.actions'.close,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'gif', 'mp4', 'webm', 'pdf' },
            -- find command (defaults to `fd`)
            find_cmd = 'rg',
          },
        },
      }
    end,
  },

  -- telescope-cheat.nvim
  -- NOTE: Run once to generate the cheat sheet
  {
    'yorik1984/telescope-cheat.nvim',
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>fch',
        function()
          return require 'telescope'.extensions.cheat.fd {}
        end,
        desc = 'Cheat sheet',
      },
      {
        '<leader>fcr',
        function()
          return require 'telescope'.extensions.cheat.recache()
        end,
        desc = 'Cheat sheet recache',
      },
    },
    init = function()
      local db_dir = vim.fn.stdpath 'data' .. '/databases'
      if vim.fn.isdirectory(db_dir) == 0 then
        vim.fn.mkdir(db_dir, 'p')
      end
    end,
    config = function()
      require 'telescope'.load_extension 'cheat'
    end,
  },

  -- telescope-media-files.nvim
  {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>fi',
        function()
          return require 'telescope'.extensions.media_files.media_files()
        end,
        desc = 'Media files',
      },
    },
    config = function()
      require 'telescope'.load_extension 'media_files'
    end,
  },

  -- auto-session
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
      log_level = 'error',
      auto_session_suppress_dirs = { '/', '~/' },
      pre_save_cmds = {
        'tabdo Neotree close',
        function()
          if vim.fn.exists ':TroubleClose' then
            vim.cmd 'tabdo TroubleClose'
          end
        end,
        'tabdo DiffviewClose',
        'tabdo UndotreeHide',
      },
    },
  },
  -- vim-kitty
  { 'fladson/vim-kitty', ft = 'kitty' },

  -- gx.nvim
  {
    'chrishrb/gx.nvim',
    event = { 'BufEnter' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },

  -- markdown-preview.nvim
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    keys = {
      {
        '<leader>mp',
        '<cmd>MarkdownPreviewToggle<CR>',
        desc = 'Toggle markdown preview',
      },
    },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  }
}
