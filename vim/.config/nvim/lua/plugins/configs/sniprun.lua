
return {
  'michaelb/sniprun',
  cmd = { 'SnipRun', 'SnipInfo', 'SnipReset', 'SnipClose', 'SnipReplMemoryClean', 'SnipLive' },
  build = 'sh ./install.sh',
  init = function()
    require('core.utils').load_mappings('sniprun', {
      n = {
        ['<leader>sn'] = {
          function()
            require 'sniprun'.run('n')
          end,
          "Run Sniprun Operator"
        },
        ['<leader>snr'] = {
          function()
            require 'sniprun'.run()
          end,
          "Run Sniprun"
        },
        ['<leader>snl'] = {
          function()
            require 'sniprun.live_mode'.toggle()
          end,
          'Toggle Sniprun Live Mode',
        },
        ['<leader>sni'] = {
          function()
            require 'sniprun'.info()
          end,
          'Show Sniprun Information',
        },
        ['<leader>snc'] = {
          function()
            require 'sniprun.display'.close_all()
          end,
          'Close Sniprun',
        },
        ['<leader>snm'] = {
          function()
            require 'sniprun'.clear_repl()
          end,
          'Clear Sniprun Memory',
        },
        ['<leader>snR'] = {
          function()
            require 'sniprun'.reset()
          end,
          'Reset Sniprun',
        }
      },
      v = {
        ['<leader>snr'] = {
          function()
            require 'sniprun'.run('v')
          end,
          "Run Sniprun (Visual)"
        }
      },
    })
  end,
}
