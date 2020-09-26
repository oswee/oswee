import { ActionTypes } from './types'
import { Types } from './constants'
import { Order } from './models'

export const selectOrder = (uuid: string): ActionTypes => ({
  type: Types.SELECT,
  uuid,
})

export const fetchOrderList = (): ActionTypes => ({
  type: Types.LIST_FETCH,
})

export const fetchOrderListRequest = (): ActionTypes => ({
  type: Types.LIST_FETCH_REQUEST,
})

export const fetchOrderListSuccess = (orders: Order[]): ActionTypes => ({
  type: Types.LIST_FETCH_SUCCESS,
  orders,
})

export const fetchOrderListFailure = (error: Error): ActionTypes => ({
  type: Types.LIST_FETCH_FAILURE,
  error,
})

export const fetchOrder = (uuid: string): ActionTypes => ({
  type: Types.FETCH,
  uuid,
})

export const fetchOrderRequest = (uuid: string): ActionTypes => ({
  type: Types.FETCH_REQUEST,
  uuid,
})

export const fetchOrderSuccess = (order: Order): ActionTypes => ({
  type: Types.FETCH_SUCCESS,
  order,
})

export const fetchOrderFailure = (uuid: string, error: Error): ActionTypes => ({
  type: Types.FETCH_FAILURE,
  uuid,
  error,
})
