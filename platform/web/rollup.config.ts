import commonjs from '@rollup/plugin-commonjs'
import node from '@rollup/plugin-commonjs'
import resolve from '@rollup/plugin-node-resolve'
import typescript from 'rollup-plugin-typescript2'
import sourceMaps from 'rollup-plugin-sourcemaps'
import json from '@rollup/plugin-json'

export default {
  plugins: [
    // Allow json resolution
    json(),
    // Compile TypeScript files
    typescript({ useTsconfigDeclarationDir: true }),
    node({
      // mainFields: ['browser', 'es2015', 'module', 'jsnext:main', 'main'],
    }),
    // Allow bundling cjs modules (unlike webpack, rollup doesn't understand cjs)
    commonjs(),
    // Allow node_modules resolution, so you can use 'external' to control
    // which external modules to include in the bundle
    // https://github.com/rollup/rollup-plugin-node-resolve#usage
    resolve({
      preferBuiltins: true,
      mainFields: ['jsnext', 'module', 'main'],
    }),
    // Resolve source maps to the original source
    sourceMaps(),
  ],
}
