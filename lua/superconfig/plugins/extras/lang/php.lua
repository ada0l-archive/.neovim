-- local get_intelephense_license = function()
--   local f = assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))
--   local content = f:read("*a")
--   f:close()
--   return string.gsub(content, "%s+", "")
-- end

return {
  --{ "captbaritone/better-indent-support-for-php-with-html", ft = "php" },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                "Core",
                "SPL",
                "imagick",
                "standard",
                "pcre",
                "date",
                "json",
                "ctype",
                "SimpleXML",
                "Reflection",
                "mysqli",
              },
            },
          },
        },
      },
    },
  },
}
