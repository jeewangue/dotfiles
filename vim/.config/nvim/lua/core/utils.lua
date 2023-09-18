local M = {}
local merge_tb = vim.tbl_deep_extend

M.echo = function(str)
  vim.cmd "redraw"
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.mappings_map = {}

M.unload_mappings = function(name)
  vim.schedule(function()
    local mappings = M.mappings_map[name]

    if not mappings then
      return
    end

    for mode, mode_values in pairs(mappings) do
      for keybind, _ in pairs(mode_values) do
        vim.keymap.remove(mode, keybind)
      end
    end
  end)
end

M.load_mappings = function(name, mappings, mapping_opt)
  M.mappings_map[name] = mappings
  vim.schedule(function()
    for mode, mode_values in pairs(mappings) do
      local default_opts = mapping_opt or {}

      for keybind, mapping_info in pairs(mode_values) do
        -- merge default + user opts
        local opts = merge_tb("force", default_opts, mapping_info.opts or {})
        opts.desc = mapping_info[2]
        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end)
end


M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }

            if plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end, 0)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end

return M
