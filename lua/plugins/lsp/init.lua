return {

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      {
        "folke/neodev.nvim",
        opts = {
          library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
        },
      },
      -- { "j-hui/fidget.nvim", config = false },
      { "smjonas/inc-rename.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
              hint = {
                enable = false,
              },
            },
          },
        },
        dockerls = {},
        html = {},
        -- Convert these to seperate files in folders
        svelte = {},
        yamlls = {},
      },
      setup = {
        lua_ls = function(_, _)
          local lsp_utils = require("plugins.lsp.utils")
          lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end, { buffer = buffer, desc = "OSV Launch" })
            end
          end)
        end,
      },
    },
    config = function(plugin, opts)
      require("plugins.lsp.servers").setup(plugin, opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "ruff",
        "debugpy",
        "codelldb",
        "prettierd",
        "eslint_d",
        "shellcheck",
        "black",
        "flake8",
      },
    },
    config = function(_, opts)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local nls = require("null-ls")
      nls.setup({
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.black.with({ extra_args = { "--line-length=120" } }),
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.prettierd.with({ filetypes = { "html", "css" } }),
          nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=120" } }),
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    enabled = false, -- use lspsaga
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    config = true,
  },
  --  Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot",
    opts = {
      --copilot_node_command = vim.fn.expand("$HOME") .. "/.fnm/node-versions/v18.0.0/installation/bin/node",
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = { formatters = {
      insert_text = require("copilot_cmp.format").remove_existing,
    } },
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter()
        end
      end)
    end,
  },
}
