import { User } from './module'

// import 'oswee/apps/front/src/scss/main.css'
import './scss/main.css'

import 'oswee/libs/elements/oswee/avatar/src'
// import 'libs/elements/oswee/avatar/src'
// import '@oswee/elements/avatar'

const el: HTMLDivElement = document.createElement('div')
el.innerText = 'Hello, TypeScript'
el.className = 'ts1'
document.body.appendChild(el)

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))

console.log('Hello Bazel X1!')
