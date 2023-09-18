local M = {}

M.echo = function(str)
  vim.cmd "redraw"
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

local function shell_call(args)
  local output = vim.fn.system(args)
  assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

M.lazy = function()
  --------- lazy.nvim ---------------
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    M.echo "  Installing lazy.nvim & plugins ..."
    local repo = "https://github.com/folke/lazy.nvim.git"

    shell_call { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  -- install plugins
  require "plugins"
end

return M
