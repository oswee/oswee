import { UserActions, UserTypes } from './actions'
import { UserState } from './model'

const initialState: UserState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: 0,
  error: null,
}

export { UserState }

export default (state: UserState = initialState, action: UserActions): UserState => {
  switch (action.type) {
    case UserTypes.USER_SELECT:
      return { ...state, selected: action.payload.id }

    case UserTypes.USER_LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case UserTypes.USER_LIST_FETCH_SUCCESS:
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

    case UserTypes.USER_LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.payload.error }

    case UserTypes.USER_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case UserTypes.USER_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.payload.user.id]: action.payload.user,
        },
      }

    case UserTypes.USER_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.payload.error }

    default:
      return state
  }
}
