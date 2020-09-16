import { User } from './module'
import './scss/main.css'
import '@oswee/ui-avatar'

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))

console.log('Hello Bazel X!')
