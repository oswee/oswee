export interface Module {
  readonly id: string
  readonly title: string
  readonly permalink: string
}

export interface ModulesState {
  readonly entities: { [id: string]: Module }
  readonly ids: string[]
  readonly highlightedModule: string
  readonly fetching: boolean
  readonly currentModule: string
  readonly selected: {
    id: string
    state: number
  }
}
