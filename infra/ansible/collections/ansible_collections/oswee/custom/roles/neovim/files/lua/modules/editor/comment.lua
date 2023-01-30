local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
	vim.api.nvim_err_writeln("[modules.editor.comment] Packer not found")
	return
end

packer.use({
	"numToStr/Comment.nvim",
	disable = false,
	opt = false,
	config = function()
		require("Comment").setup({
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
		})
	end,
})

-- TJ DeVries TakeTuesday https://youtu.be/-InmtHhk2qM

-- local wk = require("which-key")

-- wk.register({
-- 	gb = "Togggle block comment",
-- 	gbc = "Toggle block comment",
-- 	gc = "Toggle line comment",
-- 	gcc = "Toggle line comment",
-- }, { mode = "n" })
--
-- wk.register({
-- 	gb = "Togggle block comment",
-- 	gc = "Toggle line comment",
-- }, { mode = "x" })
--
-- -- extra
-- wk.register({
-- 	gco = "Comment next line",
-- 	gcO = "Comment prev line",
-- 	gcA = "Comment end of line",
-- }, { mode = "n" })
--
-- -- extended
-- wk.register({
-- 	["g>"] = "Comment region",
-- 	["g>c"] = "Add line comment",
-- 	["g>b"] = "Add block comment",
-- 	["g<lt>"] = "Uncomment region",
-- 	["g<lt>c"] = "Remove line comment",
-- 	["g<lt>b"] = "Remove block comment",
-- }, { mode = "n" })
--
-- wk.register({
-- 	["g>"] = "Comment region",
-- 	["g<lt>"] = "Uncomment region",
-- }, { mode = "x" })
