const { environment } = require('@rails/webpacker');

const postcss = require('postcss');
const tailwindcss = require('tailwindcss');

environment.plugins.prepend('postcss', {
  loader: 'postcss-loader',
  options: {
    postcssOptions: {
      plugins: [
        tailwindcss('./tailwind.config.js'),
        require('autoprefixer'),
      ],
    },
  },
});

module.exports = environment;
