return {
  rootMarkers = {'.stylelintrc', 'stylelint.config.js', 'stylelint.config.cjs', '.stylelintrc.js', '.stylelintrc.json'},
  lintCommand = "stylelint --formatter unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = false,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m [%t%*[a-z]]"},
}

