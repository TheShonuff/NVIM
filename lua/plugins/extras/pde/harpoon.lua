return {
  {
    "ThePrimeagen/harpoon",
    --stylua: ignore
    keys = {
      { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Add File" },
      { "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "File Menu" },
      { "<leader>hq", function() require("harpoon.cmd-ui").toggle_quick_menu() end, desc = "Command Menu" },
      { "<leader>hc", function() require("harpoon.mark").clear_all() end, desc = "Clear Harpoon" },
      { "<leader>hk", function() require("harpoon.ui").nav_next() end, desc = "Harpoon Next"},
      { "<leader>hj", function() require("harpoon.ui").nav_prev() end, desc = "Harpoon Prev"},
      { "<leader>h1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
      { "<leader>h2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
      { "<leader>ht1", function() require("harpoon.term").gotoTerminal(1) end, desc = "Terminal 1" },
      { "<leader>ht2", function() require("harpoon.term").gotoTerminal(2) end, desc = "Terminal 2" },
      { "<leader>hst1", function() require("harpoon.term").sendCommand(1,1) end, desc = "Command 1" },
      { "<leader>hst2", function() require("harpoon.term").sendCommand(1,2) end, desc = "Command 2" },
    },
    opts = {
      global_settings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
      },
    },
  },
}
