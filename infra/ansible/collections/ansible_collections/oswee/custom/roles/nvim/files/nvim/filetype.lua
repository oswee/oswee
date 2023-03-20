vim.filetype.add({
	extension = {
		j2 = "jinja",
		Vagrantfile = "ruby",
		hcl = "hcl",
		tfstate = "json",
		tf = "terraform",
		tfvars = 'terraform-vars',
		terraformrc = "terraform",
		sh = "bash",
	},
	pattern = {
		["*/ansible/**/*.{yaml,yml}"] = "yaml.ansible",
		[".*/tasks/.*%.y(a*)ml"] = "yaml.ansible",
		["[Cc]ontainerfile.*,*.[Cc]ontainerfile"] = "dockerfile",
		[".env*"] = "sh",
		[".yamlfmt"] = "yaml",
		["*.desktop"] = "desktop",
		["*.[Jj]enkinsfile"] = "jenkinsfile",
		["*ssh.cfg"] = "sshconfig",
		["*/.ssh/config.d/*"] = "sshconfig",
		["*/sway/config-dev"] = "swayconfig",
		["*/ansible/*/roles/sway/files/config,*/sway/config"] = "swayconfig",
		["*/nginx{,-*}/*,{,*.}nginx{,.*}.conf"] = "nginx",
		["terraform/**/*.tpl"] = "yaml",
		["*.tfstate.backup"] = "json",
	},
	filename = {
		["tmux.conf.j2"] = "tmux",
		["terraform.rc"] = "terraform",
		["kitty.conf"] = "kitty",
		[".envrc"] = "bash",
	},
})
