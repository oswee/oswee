return {
  lintCommand = "markdownlint --stdin",
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c MD%n/%*[^ ] %m",
    "%f:%l MD%n/%*[^ ] %m",
  }
}
