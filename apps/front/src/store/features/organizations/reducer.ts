import { OrganizationTypes, OrganizationActionTypes } from './types'
import { OrganizationsState } from './models'

export { OrganizationsState }

const initialState: OrganizationsState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: OrganizationsState = initialState, action: OrganizationActionTypes): OrganizationsState => {
  switch (action.type) {
    case OrganizationTypes.SELECT:
      return { ...state, selected: action.uuid }

    case OrganizationTypes.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case OrganizationTypes.LIST_FETCH_SUCCESS:
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

    case OrganizationTypes.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case OrganizationTypes.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case OrganizationTypes.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.organization.uuid]: action.organization,
        },
      }

    case OrganizationTypes.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
