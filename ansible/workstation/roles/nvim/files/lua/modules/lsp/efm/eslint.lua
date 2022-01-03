return {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    "%f(%l,%c): %tarning %m",
    "%f(%l,%c): %rror %m"
  },
  lintSource = "eslint",
  rootMarkers = {
    "package.json",
    ".eslintrc.js",
    ".eslintrc.json",
  },
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
