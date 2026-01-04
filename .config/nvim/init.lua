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

vim.opt.rtp:append("/opt/homebrew/bin/fzf")

vim.keymap.set("n", "<leader>fzf", "<cmd>:FZF<CR>")

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-require-git --no-hidden --no-heading"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

vim.cmd("set completeopt+=noselect")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

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

vim.lsp.enable({ "tsgo", "ty" })
