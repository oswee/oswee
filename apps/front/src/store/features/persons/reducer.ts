import { PersonTypes, PersonActionTypes } from './types'
import { PersonsState } from './models'

export { PersonsState }

const initialState: PersonsState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: PersonsState = initialState, action: PersonActionTypes): PersonsState => {
  switch (action.type) {
    case PersonTypes.SELECT:
      return { ...state, selected: action.uuid }

    case PersonTypes.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case PersonTypes.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.persons.reduce((map, person) => {
            map[person.uuid] = person
            return map
          }, {}),
        },
        ids: action.persons.map(person => person.uuid),
      }

    case PersonTypes.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case PersonTypes.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case PersonTypes.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.person.uuid]: action.person,
        },
      }

    case PersonTypes.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
