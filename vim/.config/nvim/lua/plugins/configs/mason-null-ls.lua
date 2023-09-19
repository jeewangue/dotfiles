return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier",
        "shfmt",
        "stylua",
        "terraform_fmt",
        "black",
        "jq"
      },
      automatic_installation = true,
    })
  end,
}
