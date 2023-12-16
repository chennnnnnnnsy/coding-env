 local U = {};

--- keymap function
---@type function(mode: string, before: string, after: any, opts?: table<string,any>)
U.keymapFn = function(mode, before, after, _opts)
  local opts = _opts == nil and {noremap = true, silent = true} or _opts
  local key = vim.api.nvim_set_keymap
  local rhs = '';

  if type(after) == 'string' then
    rhs = after
  else
    for i,value in ipairs(after) do 
      rhs = rhs .. '<cmd>' .. value .. '<cr>' 
    end
  end

  key(mode, before, rhs, opts);
end

return U;
