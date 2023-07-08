return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Sorter
    "nvim-telescope/telescope-file-browser.nvim", -- File Browser in Telescope
    "cljoly/telescope-repo.nvim", -- Search File System for code repositories
    "kkharji/sqlite.lua", -- Working with SQL databases
    "aaronhallaert/advanced-git-search.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    --{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent" },
    --    { "<leader>fbu", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Buffer Find" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>flg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h<cr>", desc = "Browser" },
    { "<leader>frs", "<cmd>Telescope repo list<cr>", desc = "Repo Search" },
  },

  config = function(_, _)
    local telescope = require("telescope")
    local icons = require("config.icons")
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["?"] = actions_layout.toggle_preview,
      },
    }
    local opts = {
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = icons.ui.Forward .. " ",
        mappings = mappings,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = true,
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
        git_files = {
          theme = "dropdown",
          previewer = true,
        },
        buffers = {
          theme = "dropdown",
          previewer = true,
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          previewer = true,
          hijack_netrw = true,
          mappings = mappings,
        },
      },
    }
    telescope.setup(opts)
    --  telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("notify")
  end,
}
