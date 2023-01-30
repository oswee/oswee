vim.cmd("autocmd! BufNew,BufNewFile,Bufread */nginx{,-*}/*,{,*.}nginx{,.*}.conf :setfiletype nginx")
