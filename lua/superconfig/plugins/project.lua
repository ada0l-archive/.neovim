return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    cmd = "Telescope projects",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    opts = {},
  },
}
