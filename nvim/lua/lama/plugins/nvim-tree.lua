return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  
  config = function()
    local nvimtree = require("nvim-tree")
    local keymap = vim.keymap
    local api = require("nvim-tree.api")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1 
    
    local function change_dir_on_open()
      local node = api.tree.get_node_under_cursor()
      if node and node.type == "directory" and node.absolute_path then
        vim.cmd("cd " .. node.absolute_path)
        api.tree.reload()
        print("📂 Changed directory to: " .. node.absolute_path)
      end
    end


    local function my_on_attach(bufnr) 
      keymap.set("n", "<CR>", function()
        local node = api.tree.get_node_under_cursor()
        api.node.open.edit()
        if not node.absolute_path then
          local cwd = vim.fn.getcwd()
          print("📂 Changed directory to:" .. cwd)
        end 
      end, { buffer = bufnr, noremap = true, silent = true })  

      keymap.set("n", "O", function()
        local node = api.tree.get_node_under_cursor()
          if node then
            change_dir_on_open()
            api.node.open.edit()
          end
      end, { buffer = bufnr, noremap = true, silent = true})
    end


-------setup--------   
  nvimtree.setup({
    view = {
       width = 35,
       relativenumber = true,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {            
          folder = {
            arrow_closed = "",
            arrow_open = "", 
          },
        },
      },
     },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    sync_root_with_cwd = true,
    actions = {
      open_file = {    
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {    
      custom = { ".DS_Store" },
    },
    git = {
      ignore = false,
    },
    on_attach = my_on_attach  
  }) 
   
  end
}
