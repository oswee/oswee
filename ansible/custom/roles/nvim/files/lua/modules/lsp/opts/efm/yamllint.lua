return {
  lintCommand = "yamllint --strict --format parsable ${INPUT}",
  lintStdin = false,
  lintFormats = {
    "%f:%l:%c: [%t%*[a-z]] %m",
  },
  env = {
    "PYTHONIOENCODING=UTF-8",
  },
  rootMarkers = {
    ".yamllint",
  },
}
