return {
  formatCommand = ([[
    npx --no-install prettier
    ${--config-precedence:configPrecedence}
    ${--tab-width:tabWidth}
    ${--single-quote:singleQuote}
    ${--trailing-comma:trailingComma}
  ]]):gsub(
    "\n",
    ""
  )
}
