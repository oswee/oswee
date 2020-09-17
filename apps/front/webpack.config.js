// const path = require("path")
module.exports = (env, argv) => ({
  mode: argv.mode,
  module: {
    rules: [
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [
          {loader: 'style-loader'},
          {
            loader: 'css-loader',
            query: {
              modules: true,
            },
          },
        ],
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.js', '.json', 'css', '.scss'],
    // alias: {
    // oswee: path.resolve(process.env.RUNFILES, "oswee")
    // }
  },
})

// import webpack from 'webpack'
// import path from 'path'

// const config: webpack.configuration = {
//   context: __dirname, // to automatically find tsconfig.json
//   entry: {
//     main: './src/index.ts',
//     /* vendor: './src/vendor.ts', */
//   },
//   module: {
//     rules: [
//       {
//         test: /\.html$/,
//         use: ['html-loader'],
//       },
//       {
//         test: /\.ts?$/,
//         loader: require.resolve('ts-loader'),
//       },
//       {
//         enforce: 'pre',
//         test: /\.js$/,
//         loader: 'source-map-loader',
//       },
//     ],
//   },
//   resolve: {
//     extensions: ['.ts', '.js', '.json', 'css', '.scss'],
//     alias: {
//       oswee: path.resolve(process.env.runfiles, "oswee"),
//     },
//   },
//   stats: {children: false},
// }

// export default config
