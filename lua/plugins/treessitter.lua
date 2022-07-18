require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "lua", "rust", "bash", "cpp", "css", "dockerfile",
        "go", "html", "javascript", "json", "latex", "lua", "make",
        "markdown", "prisma", "python", "scss", "vim", "sql"
    },
    auto_install = true,
    highlight = {
        enable = true,
    }
}
