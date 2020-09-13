import { User } from './module'
import './scss/main.scss'

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))
