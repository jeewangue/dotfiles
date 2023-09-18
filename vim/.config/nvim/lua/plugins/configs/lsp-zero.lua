return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  lazy = true,
  config = function()
    -- This is where you modify the settings for lsp-zero
    -- Note: autocompletion settings will not take effect

    require('lsp-zero.settings').preset({})
  end
}
