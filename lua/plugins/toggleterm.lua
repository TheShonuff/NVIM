return {
  "akinsho/toggleterm.nvim",
  keys = {
    { [[<C-\>]] },
    { "<leader>0", "<Cmd>ToggleTerm direction=float<Cr>", desc = "Floating Terminal" },
    { "<leader>9", "<Cmd>ToggleTerm direction=vertical<Cr>", desc = "Vertical Terminal" },
  },
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = 60,
    hide_numbers = true,
    open_mapping = [[<C-\>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 0.3,
    start_in_insert = true,
    persist_size = true,
    direction = "vertical",
    winbar = {
      enabled = false,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
}
