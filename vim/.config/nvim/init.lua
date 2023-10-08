-- Safely require files
---@param module string
---@return any
local function safe_require(module)
  local success, loaded_module = pcall(require, module)
  if success then
    return loaded_module
  end
  vim.api.nvim_echo({ { 'Error loading ' .. module } }, false, {})
end

safe_require 'core.options'
safe_require 'core.keymaps'
safe_require 'core.autocommands'
safe_require 'core.bootstrap'

-- Source a file
vim.api.nvim_set_keymap(
  'n',
  '<leader><C-r>',
  ':luafile %<CR>',
  { noremap = true, silent = true, desc = 'Source a file' }
)

-- Set statusline using lualine

-- require 'lspconfig'.lua_ls.setup {
--   on_init = function(client)
--     local path = client.workspace_folders[1].name
--     if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
--       client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--         runtime = {
--           -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--           version = 'LuaJIT'
--         },
--         -- Make the server aware of Neovim runtime files
--         workspace = {
--           library = { vim.env.VIMRUNTIME }
--           -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--           -- library = vim.api.nvim_get_runtime_file("", true)
--         }
--       })
--
--       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--     end
--     return true
--   end
-- }

-- vim.cmd 'source /home/jeewangue/.config/nvim/legacy.vim'
