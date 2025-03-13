return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")  


        -- Set header
        dashboard.section.header.val = {
            "                                                                                           ",                                                                                                             
            "                         88                                  88",                                 
            "                         88                           ,d     \"\"",                                 
            "                         88                           88",                                        
            "8b,dPPYba,   ,adPPYYba,  88   ,adPPYba,  ,adPPYba,  MM88MMM  88  8b,dPPYba,    ,adPPYba,",        
            "88P'    \"8a  \"\"     `Y8  88  a8P_____88  I8[    \"\"    88     88  88P'   `\"8a  a8P_____88",        
            "88       d8  ,adPPPPP88  88  8PP\"\"\"\"\"\"\"   `\"Y8ba,     88     88  88       88  8PP\"\"\"\"\"\"\"",        
            "88b,   ,a8\"  88,    ,88  88  \"8b,   ,aa  aa    ]8I    88,    88  88       88  \"8b,   ,aa",        
            "88`YbbdP\"'   `\"8bbdP\"Y8  88   `\"Ybbd8\"'  `\"YbbdP\"'    \"Y888  88  88       88   `\"Ybbd8\"'",        
            "88",                                                                                              
            "88",
            "                                                                                           ",
            "                                   bbbbbbbbbbbbbbbbbbbb ",
            "                                    dbdbdbdbdbdbdbdbdb  ",
            "                                     bbdbbbdbbdbbdbbb   ",
            "                                      bbdbdbbbbdbbbd    ",
            "                                       bbbbbdbdbbdb     ",
            "                                        dbdbbbbbbb      ",
            "                                         bbdbdbdb       ",
            "                                           bbbb         ",
            "                                            db           ",
            "                                                                                           ",
        }      
        

      -- Set the highlight group for the header
        dashboard.section.header.opts.hl = "MyCustomHeader"

        -- Create a highlight group
        vim.cmd([[highlight MyCustomHeader guifg=#FF0000]])

           -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
            dashboard.button("SPC fe", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC s", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
            dashboard.button("SPC fr", "󰒋  > Open Recent Files", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
        }


        -- Send config to alpha
        alpha.setup(dashboard.opts)  

        -- vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
