import { Reducer, ReducersMapObject } from 'redux'
import { reducerRegistry } from './reducerRegistry'

export type UpdatedReducer = Reducer & {
  updates: ReducersMapObject
  sliceName: string
  updateReducer: (newReducer: ReducersMapObject) => void
}

/**
 * Some comment
 */
export const createReducer = (sliceName: string, initialState: any, updates?: any): UpdatedReducer => {
  const reducer = (...args: Array<any>) => {
    const state = args.length > 0 && args[0] !== undefined ? args[0] : initialState
    const action = args[1]

    if (action.type in reducer.updates) {
      return reducer.updates[action.type](state, action)
    }
    return state
  }
  reducer.sliceName = sliceName
  reducer.updates = updates || {}

  reducer.updateReducer = (newReducer: ReducersMapObject) => {
    reducer.updates = { ...reducer.updates, ...newReducer }
  }

  reducerRegistry.register(reducer)
  return reducer
}
