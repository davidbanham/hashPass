install
=====
npm install hashpass

usage
=====
```coffeescript
hashPass [pass], [salt]
```

examples
=====

```coffeescript
hashPass = require 'hashPass'

console.log hashPass()
# { pass: 'ac7f80b56',
# salt: 'd8e1476b44b8e3c905e2db2be51ad0a1062a8992',
# hash: 'CcUj96u98mE=' }

console.log hashPass('mytotallysecretpassword')
# { pass: 'mytotallysecretpassword',
# salt: '5e75b36dd4e3ed05b0fb7e1ca4e0bfe1dde1c456',
# hash: 'cJ6HdyDYQN4=' }

cipher = crypto.createCipher 'blowfish', 'mytotallysecretpassword' + '5e75b36dd4e3ed05b0fb7e1ca4e0bfe1dde1c456'
console.log = cipher.final 'base64'
# cJ6HdyDYQN4=

console.log hashPass('mytotallysecretpassword', '5e75b36dd4e3ed05b0fb7e1ca4e0bfe1dde1c456')
# { pass: 'mytotallysecretpassword',
# salt: '5e75b36dd4e3ed05b0fb7e1ca4e0bfe1dde1c456',
# hash: 'cJ6HdyDYQN4=' }
```
