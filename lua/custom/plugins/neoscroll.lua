return {
  'karb94/neoscroll.nvim',
  event = 'WinScrolled', -- lazy-load when scrolling
  config = function()
    local neoscroll = require 'neoscroll'

    neoscroll.setup {
      -- default easing
      easing = 'quartic',
    }

    -- custom keymaps
    local keymap = {
      -- Use the "sine" easing function
      ['<C-u>'] = function()
        neoscroll.ctrl_u { duration = 150, easing = 'cubic' }
      end,
      ['<C-d>'] = function()
        neoscroll.ctrl_d { duration = 150, easing = 'cubic' }
      end,
      -- Use the "circular" easing function
      ['<C-b>'] = function()
        neoscroll.ctrl_b { duration = 200, easing = 'circular' }
      end,
      ['<C-f>'] = function()
        neoscroll.ctrl_f { duration = 200, easing = 'circular' }
      end,
      -- Fall back to default easing (quadratic)
      ['<C-y>'] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 30 })
      end,
      ['<C-e>'] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 30 })
      end,
    }

    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func, { desc = 'Neoscroll ' .. key })
    end
  end,
}
