import { Types } from './constants'
import { Person } from './models'

interface Select {
  readonly type: Types.SELECT
  readonly uuid: string
}
interface ListFetch {
  readonly type: Types.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: Types.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: Types.LIST_FETCH_SUCCESS
  readonly persons: Person[]
}
interface ListFetchFailure {
  readonly type: Types.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: Types.FETCH
  readonly uuid: string
}
interface FetchRequest {
  readonly type: Types.FETCH_REQUEST
  readonly uuid: string
}
interface FetchSuccess {
  readonly type: Types.FETCH_SUCCESS
  readonly person: Person
}
interface FetchFailure {
  readonly type: Types.FETCH_FAILURE
  readonly uuid: string
  readonly error: Error
}

export type ActionTypes =
  | Select
  | ListFetch
  | ListFetchRequest
  | ListFetchSuccess
  | ListFetchFailure
  | Fetch
  | FetchRequest
  | FetchSuccess
  | FetchFailure
