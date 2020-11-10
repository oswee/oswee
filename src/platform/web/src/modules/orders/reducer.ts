import { IOrderState, IOrder } from './contracts'
import produce from 'immer'
import { OrderActionTypes, OrderActionsUnion } from './actions'

export function orderReducer(state: IOrderState, action: OrderActionsUnion): IOrderState {
  return produce(state || {}, draft => {
    switch (action.type) {
      case OrderActionTypes.AddOrder: {
        state.order = action.payload.order
        break
      }
    }
  })
}
