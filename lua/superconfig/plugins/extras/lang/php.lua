return {
	{ "captbaritone/better-indent-support-for-php-with-html", ft = "php" },
	{
		"neovim/nvim-lspconfig",
    optional = true,
		opts = {
			servers = {
				intelephense = {
					settings = {
						intelephense = {
							-- possible values: stubs.txt
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
