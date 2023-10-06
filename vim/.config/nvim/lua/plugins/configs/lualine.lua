return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require 'lualine'.setup {
      sections = {
        lualine_a = {
          {
            'mode',
            icons_enabled = true,
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          'branch',
          'diff',
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = {
          'progress',
        },
        lualine_z = {
          'searchcount',
          'location',
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
          },
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
