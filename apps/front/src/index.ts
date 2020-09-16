import { User } from './module'
import './scss/main.css'

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))

console.log('Hello Bazel!')
