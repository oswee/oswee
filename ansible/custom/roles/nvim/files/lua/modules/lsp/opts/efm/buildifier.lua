return {
  lintCommand = "npx --no-install @bazel/buildifier -lint warn",
  lintStdin = true,
  -- lintDebounce = "2s",
  -- formatCommand = "npx --no-install buildifier -lint fix",
  -- formatStdin = false,
}

