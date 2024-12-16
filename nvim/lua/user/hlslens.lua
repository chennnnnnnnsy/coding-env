local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then return end

hlslens.setup({
  -- calm_down = true,
  -- nearest_only = true,
  -- nearest_float_when = 'always'

  override_lens = function(render, plist, nearest, idx, r_idx)
    local _ = r_idx
    local lnum, col = unpack(plist[idx])
    local text, chunks

    if nearest then
      text = ('[- %d/%d -]'):format(idx, #plist)
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
    else
      text = ('[%d]'):format(idx)
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
    end
    render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
  end
})

-- keymap
local utils = require('user/utils')
utils.keymapFnPro('n', 'n', {"cmd#execute('normal! ' . v:count1 . 'n')","cmd#lua require('hlslens').start()","zz"})
utils.keymapFnPro('n', 'N', {"cmd#execute('normal! ' . v:count1 . 'N')","cmd#lua require('hlslens').start()","zz"})
utils.keymapFnPro('n', '*', {"*","cmd#lua require('hlslens').start()"})

