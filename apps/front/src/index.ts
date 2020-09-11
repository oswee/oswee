import { User } from './module'

function printUser(user: User) {
  console.log(`the user is ${user.name}`)
}

printUser(new User('testUser'))
