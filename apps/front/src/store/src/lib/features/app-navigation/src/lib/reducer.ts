import { Types } from './constants'
import { AppNavigationActionTypes } from './types'
import { IState } from './models'
import { ListModulesResponse as ListModulesResponseRpc, Module } from '@dzintars/npm-test-pkg'

export { IState }

const initialState: IState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  applicationId: '',
  error: null,
}

export default (state: IState = initialState, action: AppNavigationActionTypes): IState => {
  switch (action.type) {
    // case Types.SELECT_MODULE:
    //   return {
    //     ...state,
    //     selected: action.payload.id,
    //   }

    // case Types.LIST_FETCH_MODULES_REQUEST:
    //   return { ...state, fetching: true, error: null }

    // case Types.LIST_FETCH_MODULES_SUCCESS:
    //   return {
    //     ...state,
    //     fetching: false,
    //     entities: {
    //       ...action.payload.entities,
    //     },
    //     ids: action.payload.ids,
    //   }

    // case Types.LIST_MODULES_RESPONSE:
    //   return {
    //     ...state,
    //     entities: {
    //       ...action.payload.entities,
    //     },
    //     ids: action.payload.ids,
    //   }
    case Types.ListModulesResponse:
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
