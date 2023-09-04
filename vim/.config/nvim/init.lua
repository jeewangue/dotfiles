-- require "core"
--
-- local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]
--
-- if custom_init_path then
--   dofile(custom_init_path)
-- end
--
-- require("core.utils").load_mappings()
--
-- local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
--
-- -- bootstrap lazy.nvim!
-- if not vim.loop.fs_stat(lazypath) then
--   require("core.bootstrap").gen_chadrc_template()
--   require("core.bootstrap").lazy(lazypath)
-- end
--
-- dofile(vim.g.base46_cache .. "defaults")
-- vim.opt.rtp:prepend(lazypath)
-- require "plugins"

-- Set runtimepath
-- vim.opt.runtimepath:append('/home/jeewangue/workspace/personal/repos/coc-dictd')
-- vim.opt.runtimepath:append('/home/jeewangue/workspace/personal/repos/coc-translate')
-- vim.opt.runtimepath:append('/home/jeewangue/workspace/personal/repos/coc-pyright')
-- vim.opt.runtimepath:append('/home/jeewangue/workspace/personal/repos/coc-paste-pandoc')

-- Vim 8 defaults
vim.opt.compatible = false
vim.opt.encoding = 'UTF-8'
vim.opt.fileencoding = 'UTF-8'
vim.opt.fileencodings:append('utf8,euc-kr,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le')
vim.opt.visualbell = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.opt.swapfile = true
vim.opt.wildmenu = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.termguicolors = true
vim.opt.maxmempattern = 50000



if vim.fn.has('nvim') then
  vim.opt.signcolumn = 'auto:4'
else
  vim.opt.signcolumn = 'auto'
end

vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.cmd('syntax on')

vim.cmd('source ~/.config/nvim/legacy.vim')

-- Set GUI font
vim.opt.guifont = "Hack Nerd Font:h12"

-- Source a file when it's saved
vim.api.nvim_set_keymap('n', '<leader><C-r>', ':so %<CR>', { noremap = true, silent = true })

-- Set statusline using lualine
require 'lualine'.setup {
  sections = {
    lualine_a = {
      {
        'mode',
        icons_enabled = true,
        fmt = function(str) return str:sub(1, 1) end
      },
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_b = { 'branch', 'diff', 'diagnostic' },
    lualine_c = {
      {
        -- [{'highlight': 'CocSymbolModule', 'name': 'tests'}, {'highlight': 'CocSymbolFunction', 'name': 'test_header_try_from_bytes_not_enough_bytes'}]
        'vim.fn.json_encode(vim.fn.getbufvar(vim.fn.bufnr(), "coc_nav"))',
        type = 'lua_expr',
        fmt = function(nav)
          if nav == nil or nav == '' or string.len(nav) < 4 then
            return ''
          end
          -- vim.notify('nav: ' .. vim.inspect(nav))
          local symbols = vim.json.decode(nav)
          local result = {}
          for _, symbol in ipairs(symbols) do
            table.insert(result, symbol.name)
          end
          return table.concat(result, ' > ')
        end,
        color = { fg = '#ffaa88', bg = 'black', gui = 'italic' },
      }
    },
    lualine_x = {
      {
        'g:coc_status',
        type = 'var',
      },
      'encoding', 'fileformat', 'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'searchcount', 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path

      }
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },

}

require 'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          library = { vim.env.VIMRUNTIME }
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
