return {
  {
    'ahmedkhalf/project.nvim',
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    opts = {}
  }
}
