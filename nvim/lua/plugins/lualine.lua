return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require('lualine')

    -- Color table for highlights - Tokyo Night Moon theme
    -- stylua: ignore
    local colors = {
      bg       = '#222436',
      fg       = '#c8d3f5',
      yellow   = '#ffc777',
      cyan     = '#86e1fc',
      darkblue = '#1e2030',
      green    = '#c3e88d',
      orange   = '#ff966c',
      violet   = '#c099ff',
      magenta  = '#c099ff',
      blue     = '#82aaff',
      red      = '#ff757f',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Tokyo-inspired helper functions
    local function get_time_icon()
      local hour = tonumber(os.date('%H'))
      if hour >= 5 and hour < 10 then
        return '☕' -- Day sun
      elseif hour >= 10 and hour < 12 then
        return '🌞' -- Day sun
      elseif hour >= 12 and hour < 5 then
        return '💻' -- Day sun
      elseif hour >= 18 and hour < 22 then
        return '🌆' -- Evening
      else
        return '🌃' -- Night moon (your kanji idea!)
      end
    end

    local function tokyo_greeting()
      local hour = tonumber(os.date('%H'))
      if hour >= 5 and hour < 12 then
        return 'おはよう' -- Good morning
      elseif hour >= 12 and hour < 18 then
        return 'こんにちは' -- Good afternoon
      else
        return 'こんばんは' -- Good evening
      end
    end

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Tokyo-inspired left border with time-based icon
    ins_left {
      function()
        return get_time_icon()
      end,
      color = function()
        local hour = tonumber(os.date('%H'))
        if hour >= 6 and hour < 18 then
          return { fg = colors.yellow } -- Day
        elseif hour >= 18 and hour < 22 then
          return { fg = colors.orange } -- Evening
        else
          return { fg = colors.blue }   -- Night
        end
      end,
      padding = { left = 0, right = 1 },
    }

    ins_left {
      -- mode component with Japanese mode indicators
      function()
        local mode_map = {
          n = 'ノーマル🥷', -- Normal
          i = 'インサート🍜', -- Insert
          v = 'ビジュアル🏮', -- Visual
          [''] = 'ビジュアル', -- Visual block
          V = 'ビジュアル', -- Visual line
          c = 'コマンド', -- Command
          no = 'ノーマル',
          s = 'セレクト', -- Select
          S = 'セレクト',
          [''] = 'セレクト',
          ic = 'インサート',
          R = 'リプレース', -- Replace
          Rv = 'リプレース',
          cv = 'コマンド',
          ce = 'コマンド',
          r = '確認', -- Confirm (keeping kanji as it's more of a status)
          rm = '確認',
          ['r?'] = '確認',
          ['!'] = 'シェル', -- Shell
          t = 'ターミナル', -- Terminal
        }
        return mode_map[vim.fn.mode()] or ''
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    }

    ins_left {
      -- filesize component
      'filesize',
      cond = conditions.buffer_not_empty,
    }

    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = 'bold' },
    }

    ins_left { 'location' }

    ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = '🔴 ', warn = '🟡 ', info = '🔵 ' }, -- Japanese-style circle indicators
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
      },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return '%='
      end,
    }

    ins_left {
      -- Lsp server name with Japanese prefix
      function()
        local msg = 'LSP無し' -- No LSP (LSP nashi)
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return ' ' .. client.name -- Language: (gengo:)
          end
        end
        return msg
      end,
      icon = '🗼', -- Japanese lantern
      color = { fg = '#ffffff', gui = 'bold' },
    }

    -- Add components to right sections
    ins_right {
      'o:encoding',
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = 'bold' },
    }

    ins_right {
      'fileformat',
      fmt = string.upper,
      icons_enabled = false,
      color = { fg = colors.green, gui = 'bold' },
    }

    ins_right {
      'branch',
      icon = '🌸', -- Cherry blossom for git branch
      color = { fg = colors.violet, gui = 'bold' },
    }

    ins_right {
      'diff',
      symbols = { added = '➕ ', modified = '📝 ', removed = '➖ ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }

    -- Optional: Time-based greeting
    ins_right {
      function()
        return tokyo_greeting()
      end,
      color = { fg = colors.cyan, gui = 'bold' },
      cond = function() return vim.fn.winwidth(0) > 120 end, -- Only show on wide screens
    }

    -- Tokyo-inspired right border (matching left)
    ins_right {
      function()
        return get_time_icon()
      end,
      color = function()
        local hour = tonumber(os.date('%H'))
        if hour >= 6 and hour < 18 then
          return { fg = colors.yellow }
        elseif hour >= 18 and hour < 22 then
          return { fg = colors.orange }
        else
          return { fg = colors.blue }
        end
      end,
      padding = { left = 1 },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
