module.exports = {
  prompt: ({ prompter, args }) => {
    return new Promise((resolve, reject) => {
      if (!args.feature) {
        prompter
          .prompt({
            type: 'input',
            name: 'feature',
            message: 'Feature name of the redux feature (e.g. my-feature or myfeature)?',
          })
          .then(values => {
            resolve({ ...args, ...values })
          })
      } else {
        resolve({ ...args })
      }
    }).then(values => {
      // if (values.feature.indexOf('-') <= 0) throw new Error('feature must contain hyphen')
      return values
    })
  },
}
