" The last file type by default is used for syntax hl.

" autocmd! BufNew,BufNewFile,BufRead */ansible/**/*.yaml,*/ansible/**/*.yml :setfiletype yaml.ansible
autocmd! BufNew,BufNewFile,BufRead */ansible/**/*.yaml,*/ansible/**/*.yml set syntax=yaml filetype=yaml.ansible
