const path = require('path');
const ReactRefreshPlugin = require('@pmmmwh/react-refresh-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    mode: 'development',
    entry: {
        main: './src/index.ts',
    },
    module: {
        rules: [
            {
                test: /\.html$/,
                use: ['html-loader'],
            },
            {
                test: /\.ts?$/,
                loader: require.resolve('ts-loader'),
            },
            {
                enforce: 'pre',
                test: /\.js$/,
                loader: 'source-map-loader',
            }, {
                test: /\.css|\.s(c|a)ss$/,
                use: [
                    // Order of the loaders are important!
                    { loader: 'style-loader' }, // 3. Inject styles into DOM
                    { loader: 'css-loader', options: { modules: false, url: false } }, // 2. Turns CSS into commonjs (CSS Modules - it has some issues when On)
                    { loader: 'sass-loader' }, // 1. Turns SCSS into CSS
                ],
            },
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            filename: './index.html',
            template: './public/index.html',
        }),
    ],
    resolve: {
        extensions: ['.ts', '.js', '.json', 'css', '.scss'],
    },
};
