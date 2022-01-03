return {
  lintCommand = "vint --enable-neovim --style-problem --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintSource = "vint"
}
