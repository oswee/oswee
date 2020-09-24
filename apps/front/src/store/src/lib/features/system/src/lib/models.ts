export interface SystemState {
  readonly entities: { [id: string]: object }
  readonly ids: string[]
  readonly selected: string
  readonly error: Error
}
