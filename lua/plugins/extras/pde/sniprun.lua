return {
  {
    "michaelb/sniprun",
    enabled = true,
    build = "bash ./install.sh 1",
    opts = {
      display = { "TempFloatingWindow" },
      display_options = {
        notification_timeout = 10,
      },
    },
    config = function(_, opts)
      require("sniprun").setup(opts)
    end,
    --stylua: ignore
    keys = {
      {"<leader>rA", function() require("sniprun.api").run_range(1, vim.fn.line("$")) end, desc = "All", },
      {"<leader>rC", function() require("sniprun.display").close_all() end, desc = "Close",},
      {"<leader>rc", function() require("sniprun").run() end, desc = "Current"},
      {"<leader>ri", function() require("sniprun").info() end, desc = "Info"},
      {"<leader>rl", function() require("sniprun.live_mode").toggle() end, desc = "Live Mode",},
      {"<leader>rp", function() require("sniprun").clear_repl() end, desc = "Clear REPL"},
      {"<leader>rr", function() require("sniprun").reset() end, desc = "Reset"},
      {"<leader>rs", function() require("sniprun").run("v") end, mode = {"v"}, desc = "Selection"},
    },
  },
}
