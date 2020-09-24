import { OrderTypes, OrderActionTypes } from './types'
import { Order } from './models'

export const selectOrder = (uuid: string): OrderActionTypes => ({
  type: OrderTypes.SELECT,
  uuid,
})

export const fetchOrderList = (): OrderActionTypes => ({
  type: OrderTypes.LIST_FETCH,
})

export const fetchOrderListRequest = (): OrderActionTypes => ({
  type: OrderTypes.LIST_FETCH_REQUEST,
})

export const fetchOrderListSuccess = (orders: Order[]): OrderActionTypes => ({
  type: OrderTypes.LIST_FETCH_SUCCESS,
  orders,
})

export const fetchOrderListFailure = (error: Error): OrderActionTypes => ({
  type: OrderTypes.LIST_FETCH_FAILURE,
  error,
})

export const fetchOrder = (uuid: string): OrderActionTypes => ({
  type: OrderTypes.FETCH,
  uuid,
})

export const fetchOrderRequest = (uuid: string): OrderActionTypes => ({
  type: OrderTypes.FETCH_REQUEST,
  uuid,
})

export const fetchOrderSuccess = (order: Order): OrderActionTypes => ({
  type: OrderTypes.FETCH_SUCCESS,
  order,
})

export const fetchOrderFailure = (uuid: string, error: Error): OrderActionTypes => ({
  type: OrderTypes.FETCH_FAILURE,
  uuid,
  error,
})
