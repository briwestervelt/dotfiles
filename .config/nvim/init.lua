
CFG_BASE_DIR = os.getenv("HOME") .. "/.config/nvim"

function map_toggle_option(mode, map, option)
    vim.keymap.set(mode, map,
        "<cmd>set "..option.."!<CR><cmd>set "..option.."?<CR>")
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statusline = vim.opt.statusline + "%F"
vim.opt.laststatus = 2
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.syntax = "on"
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = ""
vim.opt.listchars = "eol:$,tab:>=,space:.,trail:~,extends:>,precedes:<"
vim.opt.formatoptions:remove("o")
vim.opt.complete:remove("i")

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.swapfile = true
vim.opt.undodir = CFG_BASE_DIR .. "/undo//"
vim.opt.backupdir = CFG_BASE_DIR .. "/backup//"
vim.opt.directory = CFG_BASE_DIR .. "/swap//"

vim.g.mapleader = " "

vim.keymap.set("n", "Q", "")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>cby", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>cbY", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>cbp", [["+p]])
vim.keymap.set("n", "<leader>h", vim.cmd.noh)

map_toggle_option("n", "<leader>ww", "wrap")
map_toggle_option("n", "<leader>ws", "list")
map_toggle_option("n", "<leader>mp", "paste")

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  command = "silent! normal! g`\"zv",
})

if os.getenv("DISPLAY") == nil then
    vim.cmd.colorscheme("darkblue")
else
    vim.cmd.colorscheme("gruvbox")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
end

