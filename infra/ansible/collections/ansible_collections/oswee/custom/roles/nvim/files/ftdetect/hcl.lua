vim.cmd("autocmd BufNew,BufNewFile,BufRead *.hcl :setfiletype hcl")
vim.cmd("autocmd BufNew,BufNewFile,BufRead .terraformrc,terraform.rc :setfiletype hcl")
