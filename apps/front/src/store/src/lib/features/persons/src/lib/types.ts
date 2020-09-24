import { Person } from './models'

export enum PersonTypes {
  SELECT = 'PERSON_SELECT',

  LIST_FETCH = 'PERSON_LIST_FETCH',
  LIST_FETCH_REQUEST = 'PERSON_LIST_FETCH_REQUEST',
  LIST_FETCH_SUCCESS = 'PERSON_LIST_FETCH_SUCCESS',
  LIST_FETCH_FAILURE = 'PERSON_LIST_FETCH_FAILURE',

  FETCH = 'PERSON_FETCH',
  FETCH_REQUEST = 'PERSON_FETCH_REQUEST',
  FETCH_SUCCESS = 'PERSON_FETCH_SUCCESS',
  FETCH_FAILURE = 'PERSON_FETCH_FAILURE',
}

interface Select {
  readonly type: PersonTypes.SELECT
  readonly uuid: string
}
interface ListFetch {
  readonly type: PersonTypes.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: PersonTypes.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: PersonTypes.LIST_FETCH_SUCCESS
  readonly persons: Person[]
}
interface ListFetchFailure {
  readonly type: PersonTypes.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: PersonTypes.FETCH
  readonly uuid: string
}
interface FetchRequest {
  readonly type: PersonTypes.FETCH_REQUEST
  readonly uuid: string
}
interface FetchSuccess {
  readonly type: PersonTypes.FETCH_SUCCESS
  readonly person: Person
}
interface FetchFailure {
  readonly type: PersonTypes.FETCH_FAILURE
  readonly uuid: string
  readonly error: Error
}

export type PersonActionTypes =
  | Select
  | ListFetch
  | ListFetchRequest
  | ListFetchSuccess
  | ListFetchFailure
  | Fetch
  | FetchRequest
  | FetchSuccess
  | FetchFailure
