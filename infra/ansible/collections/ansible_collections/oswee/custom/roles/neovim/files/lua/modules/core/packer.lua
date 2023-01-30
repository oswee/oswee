local function bootstrap()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.api.nvim_command("packadd packer.nvim")
		local errmsg = "Packer installed. Please restart Neovim and run :PackerSync to install all plugins."
		vim.api.nvim_err_writeln(errmsg)
	end
end

local is_installed, packer = pcall(require, "packer")
local use = packer.use

if not is_installed then
	bootstrap()
else
	packer.init({
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" }) -- single | rounded
			end,
		},
		profile = {
			enable = true,
			threshold = 0,
		},
	})
	packer.startup(function()
		use({ "wbthomason/packer.nvim" })

		-- if bootstrap then
		-- 	packer.sync()
		-- end
	end)
end
