import { ActionTypes } from './types'
import { Types } from './constants'
import { Organization } from './models'

export const selectOrganization = (uuid: string): ActionTypes =>
  ({
    type: Types.SELECT,
    uuid,
  } as const)

export const fetchOrganizationList = (): ActionTypes =>
  ({
    type: Types.LIST_FETCH,
  } as const)

export const fetchOrganizationListRequest = (): ActionTypes =>
  ({
    type: Types.LIST_FETCH_REQUEST,
  } as const)

export const fetchOrganizationListSuccess = (organizations: Organization[]): ActionTypes =>
  ({
    type: Types.LIST_FETCH_SUCCESS,
    organizations,
  } as const)

export const fetchOrganizationListFailure = (error: Error): ActionTypes =>
  ({
    type: Types.LIST_FETCH_FAILURE,
    error,
  } as const)

export const fetchOrganization = (uuid: string): ActionTypes =>
  ({
    type: Types.FETCH,
    uuid,
  } as const)

export const fetchOrganizationRequest = (uuid: string): ActionTypes =>
  ({
    type: Types.FETCH_REQUEST,
    uuid,
  } as const)

export const fetchOrganizationSuccess = (organization: Organization): ActionTypes =>
  ({
    type: Types.FETCH_SUCCESS,
    organization,
  } as const)

export const fetchOrganizationFailure = (uuid: string, error: Error): ActionTypes =>
  ({
    type: Types.FETCH_FAILURE,
    uuid,
    error,
  } as const)
