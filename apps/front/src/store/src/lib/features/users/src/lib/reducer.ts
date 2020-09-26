import { Actions } from './actions'
import { Types } from './constants'
import { IState } from './model'

const initialState: IState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: 0,
  error: null,
}

export { IState }

export default (state: IState = initialState, action: Actions): IState => {
  switch (action.type) {
    case Types.USER_SELECT:
      return { ...state, selected: action.payload.id }

    case Types.USER_LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.USER_LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.payload.users.reduce((map, user) => {
            map[user.id] = user
            return map
          }, {}),
        },
        ids: action.payload.users.map(user => user.id),
      }

    case Types.USER_LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.payload.error }

    case Types.USER_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.USER_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.payload.user.id]: action.payload.user,
        },
      }

    case Types.USER_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.payload.error }

    default:
      return state
  }
}
