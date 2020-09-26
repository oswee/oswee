import { Types } from './constants'
import { ActionTypes } from './types'
import { IState } from './models'

export { IState }

const initialState: IState = {
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

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    case Types.SELECT:
      return {
        ...state,
        selected: {
          ...state.selected,
          id: action.id,
          state: 0,
        },
      }

    case Types.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case Types.LIST_FETCH_SUCCESS:
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
          [action.application.id]: action.application,
        },
      }

    case Types.START:
      return {
        ...state,
        currentApplication: action.payload.id,
      }

    case Types.GET:
      return {
        ...state,
        fetching: true,
      }

    case Types.GET_SUCCESS:
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

    // case Types.LIST_APPLICATIONS_RESPONSE:
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

    case Types.ListApplicationsResponse:
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

    case Types.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
