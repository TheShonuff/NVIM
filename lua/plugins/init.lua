return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "folke/which-key.nvim",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "rcarriga/nvim-notify",
  "nvim-telescope/telescope.nvim",
  "folke/noice.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "daikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons(),
      })
    end,
  },
  { "nacro90/numb.nvim", event = "BufReadPre", config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },
  --  {
  --    "zbirenbaum/copilot.lua",
  --    cmd = "Copilot",
  --    build = ":Copilot auth",
  --    opts = {
  --      suggestion = { enabled = false },
  --      panel = { enabled = false },
  --    },
  --  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session"},
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session"},
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },

      },
  },
}

--  {
--    "monaqa/dial.nvim",
--    event = "BufReadPre",
--    config = function()
--      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
--      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
--      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
--      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
--      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
--      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
--    end,
--  },
