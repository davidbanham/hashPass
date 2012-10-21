crypto = require 'crypto'
rand = ->
  return new Date().toString()+Math.floor(Math.random()*10000)
hashPass = (pass, salt) ->
  vals = {}
  vals.pass = pass || crypto.createHash('md5').update(rand()).digest('hex').slice(0, 9)
  vals.salt = salt || crypto.createHash('sha1').update(rand()).digest('hex')
  cipher = crypto.createCipher 'blowfish', vals.pass + vals.salt
  vals.hash = cipher.final 'base64'
  return vals
module.exports = hashPass
