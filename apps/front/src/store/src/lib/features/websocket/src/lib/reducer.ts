import { Types } from './constants'
import { ActionTypes } from './types'
import { IState } from './models'

export { IState }

export const initialState: IState = {
  state: Types.DISCONNECTED,
  connected: false,
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.CONNECT:
      return { ...state, state: action.type }
    case Types.CONNECTING:
      return { ...state, state: action.type }
    case Types.CONNECTED:
      return { ...state, state: action.type, connected: true }
    case Types.SEND:
      return { ...state, state: action.type }
    case Types.DISCONNECT:
      return { ...state, state: action.type }
    case Types.DISCONNECTED:
      return { ...state, state: action.type, connected: false }

    default:
      return state
  }
}
