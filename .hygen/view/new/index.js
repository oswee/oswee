module.exports = {
  prompt: ({ prompter, args }) => {
    return new Promise((resolve, reject) => {
      if (!args.tag) {
        prompter
          .prompt({
            type: 'input',
            name: 'tag',
            message: 'Tag name of the view (e.g. my-elem)?',
          })
          .then(values => {
            resolve({ ...args, ...values })
          })
      } else {
        resolve({ ...args })
      }
    }).then(values => {
      if (values.tag.indexOf('-') <= 0) throw new Error('tag must contain hyphen')
      return values
    })
  },
}
