return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[






 ██████╗ ██████╗ ██╗   ██╗███████╗██╗███╗   ██╗███████╗
██╔════╝██╔═══██╗██║   ██║██╔════╝██║████╗  ██║██╔════╝
██║     ██║   ██║██║   ██║███████╗██║██╔██╗ ██║█████╗  
██║     ██║   ██║██║   ██║╚════██║██║██║╚██╗██║██╔══╝  
╚██████╗╚██████╔╝╚██████╔╝███████║██║██║ ╚████║███████╗
 ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
                                                       
      ]]
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
