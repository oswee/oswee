import { OrganizationTypes, OrganizationActionTypes } from './types'
import { Organization } from './models'

export const selectOrganization = (uuid: string): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.SELECT,
    uuid,
  } as const)

export const fetchOrganizationList = (): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.LIST_FETCH,
  } as const)

export const fetchOrganizationListRequest = (): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.LIST_FETCH_REQUEST,
  } as const)

export const fetchOrganizationListSuccess = (organizations: Organization[]): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.LIST_FETCH_SUCCESS,
    organizations,
  } as const)

export const fetchOrganizationListFailure = (error: Error): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.LIST_FETCH_FAILURE,
    error,
  } as const)

export const fetchOrganization = (uuid: string): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.FETCH,
    uuid,
  } as const)

export const fetchOrganizationRequest = (uuid: string): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.FETCH_REQUEST,
    uuid,
  } as const)

export const fetchOrganizationSuccess = (organization: Organization): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.FETCH_SUCCESS,
    organization,
  } as const)

export const fetchOrganizationFailure = (uuid: string, error: Error): OrganizationActionTypes =>
  ({
    type: OrganizationTypes.FETCH_FAILURE,
    uuid,
    error,
  } as const)
