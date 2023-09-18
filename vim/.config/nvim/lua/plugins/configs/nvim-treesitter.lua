return {
  "nvim-treesitter/nvim-treesitter",
  cmd = {
    "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "scss",
      "json",
      "yaml",
      "toml",
      "python",
      "bash" ,
    },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
