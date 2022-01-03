return {
  lintCommand = "jsonlint -c",
  lintStdin = true,
  lintFormats = {
    "line %l, col %c, found: %m",
  },
}

