" The last file type by default is used for syntax hl.

autocmd! BufNewFile,BufRead */ansible/**/*.{yaml,yml} set syntax=yaml filetype=yaml.ansible
