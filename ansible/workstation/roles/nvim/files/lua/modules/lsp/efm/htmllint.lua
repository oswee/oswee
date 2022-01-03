return {
  lintCommand = "npx --no-install htmllint ${INPUT}",
  lintStdin = false,
  lintFormats = {
    "%f: line %l, col %c, %m",
  },
  rootMarkers = {
    ".htmllintrc",
  },
}
