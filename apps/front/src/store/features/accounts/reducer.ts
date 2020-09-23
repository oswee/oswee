import { AccountTypes, AccountActionTypes } from './types'
import { AccountsState } from './models'

export { AccountsState }

const initialState: AccountsState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: AccountsState = initialState, action: AccountActionTypes): AccountsState => {
  switch (action.type) {
    case AccountTypes.SELECT:
      return { ...state, selected: action.uuid }

    case AccountTypes.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case AccountTypes.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.accounts.reduce((map, account) => {
            map[account.uuid] = account
            return map
          }, {}),
        },
        ids: action.accounts.map(account => account.uuid),
      }

    case AccountTypes.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case AccountTypes.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case AccountTypes.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.account.uuid]: action.account,
        },
      }

    case AccountTypes.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
