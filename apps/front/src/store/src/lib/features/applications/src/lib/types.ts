import { Types } from './constants'
import { Application, ApplicationsX } from './models'

interface Select {
  readonly type: Types.SELECT
  readonly id: string
  readonly meta: object
}
interface ListFetch {
  readonly type: Types.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: Types.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: Types.LIST_FETCH_SUCCESS
  readonly applications: Application[]
}
interface ListFetchFailure {
  readonly type: Types.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: Types.FETCH
  readonly id: string
}
interface FetchRequest {
  readonly type: Types.FETCH_REQUEST
  readonly id: string
}
interface FetchSuccess {
  readonly type: Types.FETCH_SUCCESS
  readonly application: Application
}
interface FetchFailure {
  readonly type: Types.FETCH_FAILURE
  readonly id: string
  readonly error: Error
}

interface StartApplication {
  readonly type: Types.START
  readonly payload: {
    id: string
  }
}
interface StartingApplication {
  readonly type: Types.STARTING
}
interface StartedApplication {
  readonly type: Types.STARTED
}
interface StopApplication {
  readonly type: Types.STOP
}
interface StoppedApplication {
  readonly type: Types.STOPPED
}
interface FailedApplication {
  readonly type: Types.FAILED
}

interface Get {
  readonly type: Types.GET
  readonly payload: object
  readonly meta: object
}

interface GetSuccess {
  readonly type: Types.GET_SUCCESS
  readonly payload: ApplicationsX
}

interface ListApplicationsResponse {
  readonly type: Types.ListApplicationsResponse
  readonly payload: ApplicationsX
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
  | StartApplication
  | StartingApplication
  | StartedApplication
  | StopApplication
  | StoppedApplication
  | FailedApplication
  | Get
  | GetSuccess
  | ListApplicationsResponse
