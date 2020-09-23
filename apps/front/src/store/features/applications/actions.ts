import { ApplicationTypes, ApplicationActionTypes } from './types'
import { Application, ApplicationsX } from './models'

export const selectApplication = (id: string): ApplicationActionTypes => ({
  type: ApplicationTypes.SELECT,
  id,
  meta: { websocket: true },
})

export const fetchApplicationList = (): ApplicationActionTypes => ({
  type: ApplicationTypes.LIST_FETCH,
})

export const fetchApplicationListRequest = (): ApplicationActionTypes => ({
  type: ApplicationTypes.LIST_FETCH_REQUEST,
})

export const fetchApplicationListSuccess = (applications: Application[]): ApplicationActionTypes => ({
  type: ApplicationTypes.LIST_FETCH_SUCCESS,
  applications,
})

export const fetchApplicationListFailure = (error: Error): ApplicationActionTypes => ({
  type: ApplicationTypes.LIST_FETCH_FAILURE,
  error,
})

export const fetchApplication = (id: string): ApplicationActionTypes => ({
  type: ApplicationTypes.FETCH,
  id,
})

export const fetchApplicationRequest = (id: string): ApplicationActionTypes => ({
  type: ApplicationTypes.FETCH_REQUEST,
  id,
})

export const fetchApplicationSuccess = (application: Application): ApplicationActionTypes => ({
  type: ApplicationTypes.FETCH_SUCCESS,
  application,
})

export const fetchApplicationFailure = (id: string, error: Error): ApplicationActionTypes => ({
  type: ApplicationTypes.FETCH_FAILURE,
  id,
  error,
})

export const startApplication = (id: string): ApplicationActionTypes => ({
  type: ApplicationTypes.START,
  payload: {
    id,
  },
})

export const getApplications = (): ApplicationActionTypes => ({
  type: ApplicationTypes.GET,
  payload: { stakeholder: '54322' },
  meta: { websocket: true },
})

export const getApplicationsSuccess = (payload: ApplicationsX): ApplicationActionTypes => ({
  type: ApplicationTypes.GET_SUCCESS,
  payload,
})

export const listApplicationsResponse = (payload: ApplicationsX): ApplicationActionTypes => ({
  type: ApplicationTypes.ListApplicationsResponse,
  payload,
})
