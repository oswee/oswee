import { AppNavigationTypes } from './constants'
import { AppNavigationActionTypes } from './types'
import { AppNavigationState } from './models'
import { ListModulesResponse as ListModulesResponseRpc, Module } from '@dzintars/npm-test-pkg'

export { AppNavigationState }

const initialState: AppNavigationState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  applicationId: '',
  error: null,
}

export default (state: AppNavigationState = initialState, action: AppNavigationActionTypes): AppNavigationState => {
  switch (action.type) {
    // case AppNavigationTypes.SELECT_MODULE:
    //   return {
    //     ...state,
    //     selected: action.payload.id,
    //   }

    // case AppNavigationTypes.LIST_FETCH_MODULES_REQUEST:
    //   return { ...state, fetching: true, error: null }

    // case AppNavigationTypes.LIST_FETCH_MODULES_SUCCESS:
    //   return {
    //     ...state,
    //     fetching: false,
    //     entities: {
    //       ...action.payload.entities,
    //     },
    //     ids: action.payload.ids,
    //   }

    // case AppNavigationTypes.LIST_MODULES_RESPONSE:
    //   return {
    //     ...state,
    //     entities: {
    //       ...action.payload.entities,
    //     },
    //     ids: action.payload.ids,
    //   }
    case AppNavigationTypes.ListModulesResponse:
      // const m: ListModulesResponseRpc.AsObject = action.payload
      // const r = new ListModulesResponseRpc()

      return {
        ...state,
        entities: {
          ...action.payload.entitiesMap,
        },
        ids: action.payload.idsList,
      }

    default:
      return state
  }
}
