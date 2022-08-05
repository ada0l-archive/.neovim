local M = {
  name = 'gopls',
  settings = {
    cmd = {'gopls'},
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
  }
}

return M
