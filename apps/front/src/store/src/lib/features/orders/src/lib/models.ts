export interface Order {
  readonly uuid: string
  readonly title: string
  readonly type: string
  readonly permalink: string
}

export interface IState {
  readonly entities: { [uuid: string]: Order }
  readonly ids: string[]
  readonly fetching: boolean
  readonly selected: string
  readonly error: Error
}
