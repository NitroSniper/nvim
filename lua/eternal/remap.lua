vim.g.mapleader = " "

local opt = vim.opt

opt.nu = true -- line number
opt.relativenumber = true -- line number

local width = 4
opt.tabstop = width
opt.softtabstop = width
opt.shiftwidth = width

opt.expandtab = true

opt.swapfile = false
opt.backup = false

opt.hlsearch = false --don't keep previous search highlighted
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 16
opt.signcolumn = "yes"
opt.isfname:append("@-@")


local km = vim.keymap

km.set("n", "<leader>pv", vim.cmd.Ex)

km.set("v", "J", ":m '>+1<CR>gv=gv") -- move text with J and K
km.set("v", "K", ":m '<-2<CR>gv=gv")

km.set("n", "J", "mzJ`z")

km.set("n", "n", "nzz")
km.set("n", "n", "nzz")

km.set("x", "<leader>p", "\"_dP")
km.set("n", "Q", "<nop>")
