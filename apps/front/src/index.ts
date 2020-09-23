import { User } from './ui'

// import 'oswee/apps/front/src/scss/main.css'
import './scss/main.css'

import 'oswee/libs/elements/oswee/avatar/src'
// import 'libs/elements/oswee/avatar/src'
// import '@oswee/elements/avatar'

const systemShell: HTMLElement = document.createElement('system-shell')
document.body.appendChild(systemShell)

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))
