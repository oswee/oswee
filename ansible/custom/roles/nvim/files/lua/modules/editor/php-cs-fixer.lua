local vim = vim

-- If php-cs-fixer is in $PATH, you don't need to define line below
-- vim.g.php_cs_fixer_path = "~/php-cs-fixer.phar" -- define the path to the php-cs-fixer.phar
-- vim.g.php_cs_fixer_path = "./vendor/bin/php-cs-fixer"

vim.g.php_cs_fixer_rules = '@PSR2'          -- options: --rules (default:@PSR2)
--let g:php_cs_fixer_cache = ".php_cs.cache" -- options: --cache-file
--let g:php_cs_fixer_config_file = '.php_cs' -- options: --config

vim.g.php_cs_fixer_php_path = "php"               -- Path to PHP
vim.g.php_cs_fixer_enable_default_mapping = 1     -- Enable the mapping by default (<leader>pcd)
vim.g.php_cs_fixer_dry_run = 0                    -- Call command with dry-run option
vim.g.php_cs_fixer_verbose = 0                    -- Return the output of command if 1, else an inline information.

-- vim.cmd('autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()')  -- auto run php-cs-fixer on save

