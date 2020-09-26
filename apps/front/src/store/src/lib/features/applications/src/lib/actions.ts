import { ActionTypes } from './types'
import { Types } from './constants'
import { Application, ApplicationsX } from './models'

export const selectApplication = (id: string): ActionTypes => ({
  type: Types.SELECT,
  id,
  meta: { websocket: true },
})

export const fetchApplicationList = (): ActionTypes => ({
  type: Types.LIST_FETCH,
})

export const fetchApplicationListRequest = (): ActionTypes => ({
  type: Types.LIST_FETCH_REQUEST,
})

export const fetchApplicationListSuccess = (applications: Application[]): ActionTypes => ({
  type: Types.LIST_FETCH_SUCCESS,
  applications,
})

export const fetchApplicationListFailure = (error: Error): ActionTypes => ({
  type: Types.LIST_FETCH_FAILURE,
  error,
})

export const fetchApplication = (id: string): ActionTypes => ({
  type: Types.FETCH,
  id,
})

export const fetchApplicationRequest = (id: string): ActionTypes => ({
  type: Types.FETCH_REQUEST,
  id,
})

export const fetchApplicationSuccess = (application: Application): ActionTypes => ({
  type: Types.FETCH_SUCCESS,
  application,
})

export const fetchApplicationFailure = (id: string, error: Error): ActionTypes => ({
  type: Types.FETCH_FAILURE,
  id,
  error,
})

export const startApplication = (id: string): ActionTypes => ({
  type: Types.START,
  payload: {
    id,
  },
})

export const getApplications = (): ActionTypes => ({
  type: Types.GET,
  payload: { stakeholder: '54322' },
  meta: { websocket: true },
})

export const getApplicationsSuccess = (payload: ApplicationsX): ActionTypes => ({
  type: Types.GET_SUCCESS,
  payload,
})

export const listApplicationsResponse = (payload: ApplicationsX): ActionTypes => ({
  type: Types.ListApplicationsResponse,
  payload,
})
