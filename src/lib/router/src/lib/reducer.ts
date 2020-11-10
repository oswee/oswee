import { LOCATION_CHANGE } from './constants'

const getInitialState = {
  pathname: '/',
  search: '',
  queries: {},
  hash: '',
}

export const routerReducer = (state = getInitialState, action: any) => {
  switch (action.type) {
    case LOCATION_CHANGE:
      return {
        ...state,
        ...action.payload,
      }
    default:
      return state
  }
}
