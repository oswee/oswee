import { Order } from './models'

export enum OrderTypes {
  SELECT = 'ORDER_SELECT',

  LIST_FETCH = 'ORDER_LIST_FETCH',
  LIST_FETCH_REQUEST = 'ORDER_LIST_FETCH_REQUEST',
  LIST_FETCH_SUCCESS = 'ORDER_LIST_FETCH_SUCCESS',
  LIST_FETCH_FAILURE = 'ORDER_LIST_FETCH_FAILURE',

  FETCH = 'ORDER_FETCH',
  FETCH_REQUEST = 'ORDER_FETCH_REQUEST',
  FETCH_SUCCESS = 'ORDER_FETCH_SUCCESS',
  FETCH_FAILURE = 'ORDER_FETCH_FAILURE',
}

interface Select {
  readonly type: OrderTypes.SELECT
  readonly uuid: string
}
interface ListFetch {
  readonly type: OrderTypes.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: OrderTypes.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: OrderTypes.LIST_FETCH_SUCCESS
  readonly orders: Order[]
}
interface ListFetchFailure {
  readonly type: OrderTypes.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: OrderTypes.FETCH
  readonly uuid: string
}
interface FetchRequest {
  readonly type: OrderTypes.FETCH_REQUEST
  readonly uuid: string
}
interface FetchSuccess {
  readonly type: OrderTypes.FETCH_SUCCESS
  readonly order: Order
}
interface FetchFailure {
  readonly type: OrderTypes.FETCH_FAILURE
  readonly uuid: string
  readonly error: Error
}

export type OrderActionTypes =
  | Select
  | ListFetch
  | ListFetchRequest
  | ListFetchSuccess
  | ListFetchFailure
  | Fetch
  | FetchRequest
  | FetchSuccess
  | FetchFailure
