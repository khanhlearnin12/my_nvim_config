-- ~/.config/nvim/lua/plugins/obsidian.lua


return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, or use a specific tag for stability
    lazy = true,

    ui = {enable = false},

    event = { "BufReadPre " .. vim.fn.expand("~") .. "/note/*.md"}, -- Only load in vault
    dependencies = {
      "nvim-lua/plenary.nvim",    -- Dependency cơ bản
      "nvim-telescope/telescope.nvim", -- Rất quan trọng cho việc tìm kiếm
    }, 
    opts = {
      note_id_func = nil,
      workspaces = {
        {
          name = "personal",
          path = "~/note", -- Your Obsidian vault path
        },
      },
      -- Other configurations like templates, smart actions, etc.
      -- Tùy chọn tìm kiếm: Đảm bảo sử dụng Telescope (mặc định)
      finder = "telescope",

      -- (Tùy chọn) Cấu hình Keymaps (Phím tắt)
      mappings = { 
        ['<CR>'] = { 
          function() return require("obsidian").util.smart_action() end, 
          desc = "Obsidian Smart Action", 
          buffer = true 
        },
      },
    },
  }

