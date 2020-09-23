import { Application, ApplicationsX } from './models'

export enum ApplicationTypes {
  SELECT = 'APPLICATION__SELECT',

  LIST_FETCH = 'APPLICATION__LIST_FETCH',
  LIST_FETCH_REQUEST = 'APPLICATION__LIST_FETCH_REQUEST',
  LIST_FETCH_SUCCESS = 'APPLICATION__LIST_FETCH_SUCCESS',
  LIST_FETCH_FAILURE = 'APPLICATION__LIST_FETCH_FAILURE',

  FETCH = 'APPLICATION__FETCH',
  FETCH_REQUEST = 'APPLICATION__FETCH_REQUEST',
  FETCH_SUCCESS = 'APPLICATION__FETCH_SUCCESS',
  FETCH_FAILURE = 'APPLICATION__FETCH_FAILURE',

  START = 'APPLICATION__START',
  STARTING = 'APPLICATION__STARTING', // Show the loader while loading the data
  STARTED = 'APPLICATION__STARTED',
  STOP = 'APPLICATION__STOP',
  STOPPED = 'APPLICATION__STOPPED',
  FAILED = 'APPLICATION__FAILED', // Show the error if any or RBAC restrictions

  GET = 'APPLICATION__GET',
  GET_SUCCESS = 'APPLICATION__GET_SUCCESS',
  LIST_APPLICATIONS_RESPONSE = 'APPLICATION__LIST_APPLICATIONS_RESPONSE',
  ListApplicationsResponse = 'ListApplicationsResponse',
}

interface Select {
  readonly type: ApplicationTypes.SELECT
  readonly id: string
  readonly meta: object
}
interface ListFetch {
  readonly type: ApplicationTypes.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: ApplicationTypes.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: ApplicationTypes.LIST_FETCH_SUCCESS
  readonly applications: Application[]
}
interface ListFetchFailure {
  readonly type: ApplicationTypes.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: ApplicationTypes.FETCH
  readonly id: string
}
interface FetchRequest {
  readonly type: ApplicationTypes.FETCH_REQUEST
  readonly id: string
}
interface FetchSuccess {
  readonly type: ApplicationTypes.FETCH_SUCCESS
  readonly application: Application
}
interface FetchFailure {
  readonly type: ApplicationTypes.FETCH_FAILURE
  readonly id: string
  readonly error: Error
}

interface StartApplication {
  readonly type: ApplicationTypes.START
  readonly payload: {
    id: string
  }
}
interface StartingApplication {
  readonly type: ApplicationTypes.STARTING
}
interface StartedApplication {
  readonly type: ApplicationTypes.STARTED
}
interface StopApplication {
  readonly type: ApplicationTypes.STOP
}
interface StoppedApplication {
  readonly type: ApplicationTypes.STOPPED
}
interface FailedApplication {
  readonly type: ApplicationTypes.FAILED
}

interface Get {
  readonly type: ApplicationTypes.GET
  readonly payload: object
  readonly meta: object
}

interface GetSuccess {
  readonly type: ApplicationTypes.GET_SUCCESS
  readonly payload: ApplicationsX
}

interface ListApplicationsResponse {
  readonly type: ApplicationTypes.ListApplicationsResponse
  readonly payload: ApplicationsX
}

export type ApplicationActionTypes =
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
