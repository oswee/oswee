import { ActionTypes } from './types'
import { Types } from './constants'
import { Person } from './models'

export const selectPerson = (uuid: string): ActionTypes => ({
  type: Types.SELECT,
  uuid,
})

export const fetchPersonList = (): ActionTypes => ({
  type: Types.LIST_FETCH,
})

export const fetchPersonListRequest = (): ActionTypes => ({
  type: Types.LIST_FETCH_REQUEST,
})

export const fetchPersonListSuccess = (persons: Person[]): ActionTypes => ({
  type: Types.LIST_FETCH_SUCCESS,
  persons,
})

export const fetchPersonListFailure = (error: Error): ActionTypes => ({
  type: Types.LIST_FETCH_FAILURE,
  error,
})

export const fetchPerson = (uuid: string): ActionTypes => ({
  type: Types.FETCH,
  uuid,
})

export const fetchPersonRequest = (uuid: string): ActionTypes => ({
  type: Types.FETCH_REQUEST,
  uuid,
})

export const fetchPersonSuccess = (person: Person): ActionTypes => ({
  type: Types.FETCH_SUCCESS,
  person,
})

export const fetchPersonFailure = (uuid: string, error: Error): ActionTypes => ({
  type: Types.FETCH_FAILURE,
  uuid,
  error,
})
