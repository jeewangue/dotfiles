-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local plugins = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	require "plugins.configs.auto-session",
	require "plugins.configs.kanagawa",
	require "plugins.configs.colorizer",
	require "plugins.configs.lualine",
	require "plugins.configs.copilot",

	require "plugins.configs.dressing",
	require "plugins.configs.gitsigns",
	require "plugins.configs.indent-blankline",
	require "plugins.configs.nvim-treesitter",
	require "plugins.configs.telescope-fzf-native",
	require "plugins.configs.telescope-undo",
	require "plugins.configs.telescope",
	require "plugins.configs.comment",
	require "plugins.configs.sniprun",
	require "plugins.configs.nvim-tree",
  require "plugins.configs.symbols-outline",
  require "plugins.configs.fterm",

	-- {
	-- 	"neoclide/coc.nvim",
	-- 	branch = "master",
	-- 	build = "npm ci",
	-- 	lazy = false,
	-- },

	-- Only load whichkey after all the gui
	require "plugins.configs.which-key",


	-- lsp stuff
	require "plugins.configs.mason",
	require "plugins.configs.mason-lspconfig",
	require "plugins.configs.mason-null-ls",
	require "plugins.configs.lsp-zero",
	require "plugins.configs.cmp",
	require "plugins.configs.lspconfig",

	-- -- file managing , picker etc
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	-- 	init = function()
	-- 		require("core.utils").load_mappings "nvimtree"
	-- 	end,
	-- 	opts = function()
	-- 		return require "plugins.configs.nvimtree"
	-- 	end,
	-- 	config = function(_, opts)
	-- 		require("nvim-tree").setup(opts)
	-- 	end,
	-- },
}

local lazy_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_config)
