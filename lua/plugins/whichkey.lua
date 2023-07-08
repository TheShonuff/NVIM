return {
  {
    "folke/which-key.nvim",

    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        show_help = true,
        plugins = { spelling = true },
        key_labels = { ["<leader>"] = "SPC" },
        triggers = "auto",
      })
      wk.register({
        b = { name = "+BufferLine" },
        w = { name = "+Window" },
        q = { "<cmd>lua require('util').smart_quit()<CR>", "Quit" },
        f = { name = "+Find" },
        g = { name = "+Git" },
        h = { name = "+Harpoon" },
        t = { name = "+Test", N = { name = "Neotest" }, o = { "Overseer" } },
        r = { name = "+SnipRun" },
        s = {
          name = "+Search",
          c = {
            function()
              require("utils.cht").cht()
            end,
            "Cheatsheets",
          },
          --o = {
          --  function()
          --    require("utils.cht").stack_overflow()
          --  end,
          --  "Stack Overflow",
          --},
        },
        c = {
          name = "+Code",
          x = {
            name = "Swap Next",
            f = "Function",
            p = "Parameter",
            c = "Class",
          },
          X = {
            name = "Swap Previous",
            f = "Function",
            p = "Parameter",
            c = "Class",
          },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
