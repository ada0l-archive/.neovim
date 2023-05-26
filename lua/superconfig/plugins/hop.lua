return {
  {
    "phaazon/hop.nvim",
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    branch = "v2",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    config = function(_, opts)
      require("hop").setup(opts)
      local map = require("superconfig.core.utils").map
      map(
        "n",
        "t",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>"
      )
      map(
        "n",
        "T",
        "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>"
      )
    end,
  },
}
