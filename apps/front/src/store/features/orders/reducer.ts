import { OrderTypes, OrderActionTypes } from './types'
import { OrdersState } from './models'

export { OrdersState }

const initialState: OrdersState = {
  entities: {},
  ids: [],
  fetching: false,
  selected: '',
  error: null,
}

export default (state: OrdersState = initialState, action: OrderActionTypes): OrdersState => {
  switch (action.type) {
    case OrderTypes.SELECT:
      return { ...state, selected: action.uuid }

    case OrderTypes.LIST_FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case OrderTypes.LIST_FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          ...action.orders.reduce((map, order) => {
            map[order.uuid] = order
            return map
          }, {}),
        },
        ids: action.orders.map(order => order.uuid),
      }

    case OrderTypes.LIST_FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    case OrderTypes.FETCH_REQUEST:
      return { ...state, fetching: true, error: null }

    case OrderTypes.FETCH_SUCCESS:
      return {
        ...state,
        fetching: false,
        entities: {
          ...state.entities,
          [action.order.uuid]: action.order,
        },
      }

    case OrderTypes.FETCH_FAILURE:
      return { ...state, fetching: false, error: action.error }

    default:
      return state
  }
}
