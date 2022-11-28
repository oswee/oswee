let-env config = {
	show_banner: false
	show_clickable_links_in_ls: true
	table_mode: basic
	hooks: {
		pre_prompt: [{
			code: "
				let direnv = (direnv export json | from json)
				let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
				$direnv | load-env
			"
		}]
	}
}

alias ls = exa
alias ll = exa -alh
alias tree = exa --tree
alias zz = z -
alias r = ranger
alias fm = vifm
alias ps = procs
alias vi = nvim
alias ta = tmux a -t

source ~/.cache/starship/init.nu
source ~/.zoxide.nu

