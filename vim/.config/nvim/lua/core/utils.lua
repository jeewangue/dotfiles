local M = {}

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
        local opts = vim.tbl_deep_extend('force', default_opts, mapping_info.opts or {})
        opts.desc = mapping_info[2]
        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end)
end

return M
