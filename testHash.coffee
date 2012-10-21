assert = require 'assert'
hashPass = require './hashPass.coffee'

assert.notDeepEqual hashPass(), hashPass(), "Shouldn't do the same thing twice"
assert.strictEqual """0A®öu×}¨¢â·¾""", hashPass("""0A®öu×}¨¢â·¾""").pass, "Should return the password unmangled if provided"
rand = Math.floor(Math.random()*99999999999999999)
assert.strictEqual rand, hashPass(rand).pass, "Should return the password unmangled if provided"
assert.deepEqual hashPass("""0A®öu×}¨¢â·¾""", """õ8ôn}NôÝÌC0Ú"""), { pass: """0A®öu×}¨¢â·¾""", salt: """õ8ôn}NôÝÌC0Ú""", hash: '3yjEkV64wtY='}, "Should do nothing but run the crypto if a pass and salt are passed in"
assert.strictEqual 9, hashPass().pass.length, "Should return a 9 character password if none is provided"
assert.strictEqual 40, hashPass().salt.length, "Should return a 40 character salt"
assert.strictEqual 12, hashPass().hash.length, "Should return a 12 character hash"
assert.strictEqual 40, hashPass(rand).salt.length, "Should return a 40 character salt"
assert.strictEqual 12, hashPass(rand).hash.length, "Should return a 12 character hash"
assert.ok hashPass().pass, "Should return a pass"
assert.ok hashPass().salt, "Should return a salt"
assert.ok hashPass().hash, "Should return a hash"
