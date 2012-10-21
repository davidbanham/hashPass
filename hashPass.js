// Shim to avoid depending on globally installed coffeescript
// Include the CoffeeScript interpreter so that .coffee files will work
var coffee = require('coffee-script');

// Include our application file
module.exports = require('./hashPass.coffee');
