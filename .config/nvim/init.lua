vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false

vim.o.breakindent = true
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.pack.add({
  {
    src = "https://github.com/stevearc/conform.nvim",
    name = "conform",
  },
  {
    src = "https://github.com/jpalardy/vim-slime",
    name = "vim-slime",
  },
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.g.slime_bracketed_paste = 1
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_target = "tmux"

vim.lsp.enable({ "tsgo" })
