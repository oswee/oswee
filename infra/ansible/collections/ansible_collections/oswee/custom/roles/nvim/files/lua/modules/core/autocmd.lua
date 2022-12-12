vim.cmd("autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown")

vim.cmd("autocmd! BufNew,BufNewFile,BufRead Jenkinsfile :setfiletype groovy")
vim.cmd("autocmd! BufNew,BufNewFile,BufRead terraform/**/*.tpl :setfiletype yaml")
vim.cmd("autocmd! BufNew,BufNewFile,Bufread [Cc]ontainerfile.*,*.[Cc]ontainerfile :setfiletype Dockerfile")
vim.cmd("autocmd! BufNew,BufNewFile,Bufread */nginx{,-*}/*,{,*.}nginx{,.*}.conf :setfiletype nginx")
vim.cmd("autocmd! BufNew,BufNewFile,Bufread *ssh.cfg :setfiletype sshconfig")
