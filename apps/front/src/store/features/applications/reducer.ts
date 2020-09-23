import { ApplicationTypes, ApplicationActionTypes } from './types'
import { ApplicationsState } from './models'

export { ApplicationsState }

const initialState: ApplicationsState = {
  entities: {
    1: {
      id: '1',
      title: 'Home',
      component: 'view-home',
      permalink: '/',
      modules: [],
      defaultModule: '',
      lastModule: '',
    },
    2: {
      id: '2',
      title: 'Dispatch',
      component: 'view-dispatch',
      permalink: '/dispatch',
      modules: [],
      defaultModule: '',
      lastModule: '',
    },
    3: {
      id: '3',
      title: 'Sales',
      component: 'view-sales',
      permalink: '/sales',
      modules: [],
      defaultModule: '',
      lastModule: '',
    },
  },
  ids: ['1', '2', '3'],
  fetching: false,
  selected: {
    id: '',
    state: 0,
  },
  error: null,
  defaultApplication: '',
  currentApplication: '',
}

export default (state: ApplicationsState = initialState, action: ApplicationActionTypes): ApplicationsState => {
  switch (action.type) {
    case ApplicationTypes.SELECT:
      return {
        ...state,
        selected: {
          ...state.selected,
          id: action.id,
          state: 0,
        },
      }

    case ApplicationTypes.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case ApplicationTypes.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.applications.reduce((map, application) => {
            map[application.id] = application
            return map
          }, {}),
        },
        ids: action.applications.map(app => app.id),
      }

    case ApplicationTypes.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case ApplicationTypes.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case ApplicationTypes.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.application.id]: action.application,
        },
      }

    case ApplicationTypes.START:
      return {
        ...state,
        currentApplication: action.payload.id,
      }

    case ApplicationTypes.GET:
      return {
        ...state,
        fetching: true,
      }

    case ApplicationTypes.GET_SUCCESS:
      // console.log('APP_GET_OK', action.payload)
      return {
        ...state,
        fetching: false,
        entities: {
          // ...state.entities,
          ...action.payload.entities,
        },
        ids: action.payload.ids,
      }

    // case ApplicationTypes.LIST_APPLICATIONS_RESPONSE:
    //   // console.log('APP_GET_OK', action.payload)
    //   return {
    //     ...state,
    //     fetching: false,
    //     entities: {
    //       // ...state.entities,
    //       ...action.payload.entities,
    //     },
    //     ids: action.payload.ids,
    //   }

    case ApplicationTypes.ListApplicationsResponse:
      // console.log('APP_GET_OK', action.payload)
      return {
        ...state,
        fetching: false,
        entities: {
          // ...state.entities,
          ...action.payload.entities,
        },
        ids: action.payload.ids,
      }

    case ApplicationTypes.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
