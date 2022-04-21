'use strict'

module.exports = {
  '*.{ts,html,md}': ['npx --no-install prettier --write'],
  '*.ts': ['eslint_d --fix'],
  // '.*{rc,.json}': ['jsonlint  --in-place'],
}

// TypeScrip try

// const prettier = [
//   'prettier --write'
// ];

// const eslint = [
//   'eslint --fix'
// ];

// const json = [
//   'jsonlint --in-place'
// ];

// type Command = string;

// type Config = {
//   [file in string]: Command[];
// };

// const config: Config = {
//   '{.*,*}.{ts,html}': prettier,
//   '*.ts': eslint,
//   '*.md': prettier,
//   '{.*,*}.{js,json}': json,
// };

// export default config
