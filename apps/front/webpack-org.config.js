const path = require("path");
const webpack = require("webpack");
const fs = require("fs");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = (env, argv) => {
  const config = {
    mode: argv.mode || "development",
    // context: __dirname,
    // entry: {
    //     main = "./src/index.ts",
    // },
    entry: [path.resolve(process.env.RUNFILES, "./oswee/apps/front/src/index")],
    output: {
      path: path.dirname(path.resolve(argv.output)),
      filename: path.basename(argv.output),
      publicPath: '/',
    },
    optimization: {
      minimize: argv.mode === "production"
    },
    watchOptions: {
      ignored: [/node_modules/]
    },
    stats: {
      warnings: true
    },
    node: {
      fs: "empty",
      child_process: "empty"
    },
    devServer: {
      port: 3000,
      open: false,
      publicPath: "/",
      contentBase: path.resolve("./apps/front"),
      stats: {
        colors: true
      }
    },
    resolve: {
      extensions: [".ts", ".js", ".json", ".css"],
      alias: {
        "oswee": path.resolve(process.env.RUNFILES, "oswee")
      }
    },

    plugins: [
      new webpack.optimize.LimitChunkCountPlugin({
        maxChunks: 1
      }),
      new HtmlWebpackPlugin({
        template: path.resolve(__dirname, 'src', 'template.html'),

        favicon: path.resolve(__dirname, 'src/assets', 'favicon.ico'),

        filename: './index.html',
      }),
    ],
    module: {
      rules: [
        {
          test: /\.css$/,
          include: /node_modules/,
          use: ["style-loader", "css-loader"]
        },
        {
          test: /\.css$/,
          exclude: /node_modules/,
          use: [
            {loader: "style-loader"},
            {
              loader: "css-loader",
              query: {
                modules: true
              }
            }
          ]
        },
      ]
    }
  };
  // Only add the babel transpilation in production mode.
  if (argv.mode === "production") {
    config.module.rules.push({
      test: /\.jsx?$/,
      exclude: /node_modules/,
      use: [
        {
          loader: "babel-loader",
          options: {
            presets: [["env", {targets: {browsers: ["defaults"]}}]],
            plugins: [
              [
                "transform-runtime",
                {
                  polyfill: false,
                  regenerator: true
                }
              ]
            ]
          }
        }
      ]
    });
  }
  return config;
};
