import { Organization } from './models'
// https://www.youtube.com/watch?v=da3ygw2zJAw&t=341s
// import {
//   selectOrganization,
//   fetchOrganizationList,
//   fetchOrganizationListRequest,
//   fetchOrganizationListSuccess,
//   fetchOrganizationListFailure,
//   fetchOrganization,
//   fetchOrganizationRequest,
//   fetchOrganizationSuccess,
//   fetchOrganizationFailure,
// } from './actions'

export enum OrganizationTypes {
  SELECT = 'ORGANIZATION_SELECT',

  LIST_FETCH = 'ORGANIZATION_LIST_FETCH',
  LIST_FETCH_REQUEST = 'ORGANIZATION_LIST_FETCH_REQUEST',
  LIST_FETCH_SUCCESS = 'ORGANIZATION_LIST_FETCH_SUCCESS',
  LIST_FETCH_FAILURE = 'ORGANIZATION_LIST_FETCH_FAILURE',

  FETCH = 'ORGANIZATION_FETCH',
  FETCH_REQUEST = 'ORGANIZATION_FETCH_REQUEST',
  FETCH_SUCCESS = 'ORGANIZATION_FETCH_SUCCESS',
  FETCH_FAILURE = 'ORGANIZATION_FETCH_FAILURE',
}

interface Select {
  readonly type: OrganizationTypes.SELECT
  readonly uuid: string
}
interface ListFetch {
  readonly type: OrganizationTypes.LIST_FETCH
}
interface ListFetchRequest {
  readonly type: OrganizationTypes.LIST_FETCH_REQUEST
}
interface ListFetchSuccess {
  readonly type: OrganizationTypes.LIST_FETCH_SUCCESS
  readonly organizations: Organization[]
}
interface ListFetchFailure {
  readonly type: OrganizationTypes.LIST_FETCH_FAILURE
  readonly error: Error
}
interface Fetch {
  readonly type: OrganizationTypes.FETCH
  readonly uuid: string
}
interface FetchRequest {
  readonly type: OrganizationTypes.FETCH_REQUEST
  readonly uuid: string
}
interface FetchSuccess {
  readonly type: OrganizationTypes.FETCH_SUCCESS
  readonly organization: Organization
}
interface FetchFailure {
  readonly type: OrganizationTypes.FETCH_FAILURE
  readonly uuid: string
  readonly error: Error
}

export type OrganizationActionTypes =
  | Select
  | ListFetch
  | ListFetchRequest
  | ListFetchSuccess
  | ListFetchFailure
  | Fetch
  | FetchRequest
  | FetchSuccess
  | FetchFailure

// export type OrganizationActionInferred =
//   | ReturnType<typeof selectOrganization>
//   | ReturnType<typeof fetchOrganizationList>
//   | ReturnType<typeof fetchOrganizationListRequest>
//   | ReturnType<typeof fetchOrganizationListSuccess>
//   | ReturnType<typeof fetchOrganizationListFailure>
//   | ReturnType<typeof fetchOrganization>
//   | ReturnType<typeof fetchOrganizationRequest>
//   | ReturnType<typeof fetchOrganizationSuccess>
//   | ReturnType<typeof fetchOrganizationFailure>
