local cmd = vim.api.nvim_command

cmd("autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown")

cmd("autocmd! BufNew,BufNewFile,BufRead Jenkinsfile :setfiletype groovy")
cmd("autocmd! BufNew,BufNewFile,BufRead terraform/**/*.tpl :setfiletype yaml")
cmd("autocmd! BufNew,BufNewFile,Bufread [Cc]ontainerfile.*,*.[Cc]ontainerfile :setfiletype Dockerfile")
cmd("autocmd! BufNew,BufNewFile,Bufread */nginx{,-*}/*,{,*.}nginx{,.*}.conf :setfiletype nginx")
cmd("autocmd! BufNew,BufNewFile,Bufread *ssh.cfg :setfiletype sshconfig")
