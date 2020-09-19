import { User } from './module'
// import './scss/main.css'
// import {UiAvatarElement} from '@html-sandbox/ui-avatar-test'
// import '@oswee/elements/avatar'
// import '@oswee/elements/avatar'
// import {UiAvatarElement} from '../../../libs/elements/oswee/avatar/src/index'

const el: HTMLDivElement = document.createElement('div')
el.innerText = 'Hello, TypeScript'
el.className = 'ts1'
document.body.appendChild(el)

// const avatar: UiAvatarElement = new UiAvatarElement;
// document.body.appendChild(avatar);

// const avatar = document.createElement('ui-avatar')
// document.body.appendChild(avatar)

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))

console.log('Hello Bazel X!')
