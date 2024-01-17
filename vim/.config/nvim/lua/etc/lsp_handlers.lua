local function resolve_handler(client, method)
  return client.handlers[method] or vim.lsp.handlers[method]
end

M = {}

-- slightly tweaked implementation based on https://github.com/neovim/neovim/blob/db47cf81537f929812cd7aa3bc2b852a31cb48ae/runtime/lua/vim/lsp.lua#L719
-- allows for handlers of the form: {type: 'local_lsp', handler: <func>}
M.client_request = function(client)
    local original_client_request = client.request;
    if client._request_override_applied then
      return original_client_request;
    end

    client._request_override_applied = true;
    return function(method, params, handler, bufnr)
      if not handler then
        handler = resolve_handler(client, method)
          or error(string.format("not found: %q request handler for client %q.", method, client.name))
      end

      if (type(handler) == 'table' and handler.type == 'local_lsp') then
        handler.handler(method, params, client.id, bufnr)
        return true, 1;
      else
        return original_client_request(method, params, handler, bufnr, client.config);
      end
  end
end

M.lintCodeAction = function(method, params, client_id, bufnr, config)
  local actions = {}
  for _, diagnostic in pairs(params.context.diagnostics) do
    if (diagnostic.source == 'eslint') then
      local rule = string.match(diagnostic.message, "%[([^%]]*)%][ ]*$");
      table.insert(actions, {
        arguments = {
          newText = "// eslint-disable-next-line " .. rule,
          lineNum = diagnostic.range.start.line
        },
        command = "add_indented_new_line",
        title = "Suppress eslint rule " .. rule
      });
    end
  end

  return vim.lsp.handlers['textDocument/codeAction'](nil, method, actions, client_id, bufnr, config);
end

M.workspaceExecuteCommand = function(method, params, client_id, bufnr, config)
  if params.command == "add_indented_new_line" then
    local lineNum = params.arguments.lineNum;
    local line = vim.fn.getbufline(bufnr, lineNum + 1)[1];
    local prefix = string.match(line, "^%s*")
    vim.fn.appendbufline(bufnr, lineNum, prefix .. params.arguments.newText);
  end
end

return M
