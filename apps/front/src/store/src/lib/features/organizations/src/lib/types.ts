import { Types } from './constants'
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
  readonly organizations: Organization[]
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
  readonly organization: Organization
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
