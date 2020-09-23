export interface Person {
  readonly uuid: string
  readonly title: string
  readonly type: string
  readonly permalink: string
}

export interface PersonsState {
  readonly entities: { [uuid: string]: Person }
  readonly ids: string[]
  readonly fetching: boolean
  readonly selected: string
  readonly error: Error
}
