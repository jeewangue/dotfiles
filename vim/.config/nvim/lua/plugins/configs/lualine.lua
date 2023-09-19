local function min_window_width(width)
  return function() return vim.fn.winwidth(0) > width end
end

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require "lualine".setup({
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
        lualine_b = {
          'branch',
          'diff',
          'diagnostics'
        },
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
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = {
          'progress'
        },
        lualine_z = {
          'searchcount',
          'location'
        },
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
    })
  end,
}
