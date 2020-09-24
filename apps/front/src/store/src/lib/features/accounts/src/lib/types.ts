import { Account } from './models'

export enum AccountTypes {
  SELECT = 'ACCOUNT_SELECT',

  LIST_FETCH = 'ACCOUNT_LIST_FETCH',
  LIST_FETCH_REQUEST = 'ACCOUNT_LIST_FETCH_REQUEST',
  LIST_FETCH_SUCCESS = 'ACCOUNT_LIST_FETCH_SUCCESS',
  LIST_FETCH_FAILURE = 'ACCOUNT_LIST_FETCH_FAILURE',

  FETCH = 'ACCOUNT_FETCH',
  FETCH_REQUEST = 'ACCOUNT_FETCH_REQUEST',
  FETCH_SUCCESS = 'ACCOUNT_FETCH_SUCCESS',
  FETCH_FAILURE = 'ACCOUNT_FETCH_FAILURE',
}

interface Select {
  readonly type: AccountTypes.SELECT
  readonly uuid: string
}
interface ListFetch {
  readonly type: AccountTypes.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: AccountTypes.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: AccountTypes.LIST_FETCH_SUCCESS
  readonly accounts: Account[]
}
interface ListFetchFailure {
  readonly type: AccountTypes.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: AccountTypes.FETCH
  readonly uuid: string
}
interface FetchRequest {
  readonly type: AccountTypes.FETCH_REQUEST
  readonly uuid: string
}
interface FetchSuccess {
  readonly type: AccountTypes.FETCH_SUCCESS
  readonly account: Account
}
interface FetchFailure {
  readonly type: AccountTypes.FETCH_FAILURE
  readonly uuid: string
  readonly error: Error
}

export type AccountActionTypes =
  | Select
  | ListFetch
  | ListFetchRequest
  | ListFetchSuccess
  | ListFetchFailure
  | Fetch
  | FetchRequest
  | FetchSuccess
  | FetchFailure
