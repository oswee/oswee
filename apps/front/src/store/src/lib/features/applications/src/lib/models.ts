export interface Application {
  readonly id: string
  readonly title: string
  readonly component: string
  readonly permalink: string
  readonly modules: string[]
  readonly defaultModule: string
  readonly lastModule: string
}

export interface ApplicationsState {
  readonly entities: { [id: string]: Application }
  readonly ids: string[]
  readonly fetching: boolean
  readonly selected: {
    id: string
    state: number
  }
  readonly error: Error
  readonly defaultApplication: string
  readonly currentApplication: string
}

export interface ApplicationsX {
  readonly entities: { [id: string]: Application }
  readonly ids: string[]
}
