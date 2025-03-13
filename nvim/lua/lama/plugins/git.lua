return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "━" },
          topdelete = { text = "━" },
          changedelete = { text = "┋" },
        },
        numhl = true,
        current_line_blame = true,
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true, 
        use_icons = true,
      })
    end,
    lazy = true,
  }
}

