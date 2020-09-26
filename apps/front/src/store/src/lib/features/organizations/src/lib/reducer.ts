import { ActionTypes } from './types'
import { Types } from './constants'
import { IState } from './models'

export { IState }

const initialState: IState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.SELECT:
      return { ...state, selected: action.uuid }

    case Types.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.organizations.reduce((map, organization) => {
            map[organization.uuid] = organization
            return map
          }, {}),
        },
        ids: action.organizations.map(organization => organization.uuid),
      }

    case Types.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case Types.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.organization.uuid]: action.organization,
        },
      }

    case Types.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
