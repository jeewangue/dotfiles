return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require "auto-session".setup {
      log_level = "error",
      auto_session_suppress_dirs = { "/", "~/" },
      pre_save_cmds = {
        "tabdo NvimTreeClose",
        "tabdo SymbolsOutlineClose",
      }
    }
  end
}
