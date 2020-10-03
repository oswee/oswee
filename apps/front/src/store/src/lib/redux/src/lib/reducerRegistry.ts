export class ReducerRegistry {
  private _emitChange: (reducers: any) => void
  private _reducers: { [key: string]: any }

  constructor() {
    this._emitChange = null
    this._reducers = {}
  }

  getReducers() {
    return { ...this._reducers }
  }

  register(reducer: any) {
    this._reducers = { ...this._reducers, [reducer.sliceName]: reducer }
    if (this._emitChange) {
      this._emitChange(this.getReducers())
    }
  }

  setChangeListener(listener: any) {
    this._emitChange = listener
  }
}

export const reducerRegistry = new ReducerRegistry()
