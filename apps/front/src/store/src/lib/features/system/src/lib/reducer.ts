import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

export { IState }

const initialState: IState = {
  entities: {},
  ids: [],
  selected: '',
  error: null,
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.SELECT:
      return {
        ...state,
        selected: action.payload.id,
      }
    default:
      return state
  }
}
