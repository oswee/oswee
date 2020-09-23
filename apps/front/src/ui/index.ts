import './containers/system-shell'

export class User {
  constructor(public name: string) {}

  toString(): string {
    return `user: ${this.name}`
  }
}
