const path = require('path');

module.exports = {
  entry: {
    app: './js/controle.js',
  },
  output: {
    path: path.resolve(__dirname, 'dist'),
    clean: true,
    filename: './js/controle.js',
  },
};
