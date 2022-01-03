return {
  command = './vendor/bin/php-cs-fixer',
  args = {'fix', '--using-cache=no', '--no-interaction', '%file'},
  rootPatterns = {'composer.json', 'composer.lock', 'vendor'},
  isStdout = false,
  doesWriteToFile = true,
}
