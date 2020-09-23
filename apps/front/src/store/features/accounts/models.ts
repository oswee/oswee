export interface Account {
  readonly uuid: string
  readonly title: string
  readonly type: string
  readonly permalink: string
}

export interface AccountsState {
  readonly entities: { [uuid: string]: Account }
  readonly ids: string[]
  readonly fetching: boolean
  readonly selected: string
  readonly error: Error
}
