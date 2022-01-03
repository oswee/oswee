return {
  lintCommand = "stylelint --formatter unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = false,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m [%t%*[a-z]]"},
  rootMarkers = {".stylelintrc.js"},
}

