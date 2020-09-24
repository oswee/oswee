import { PersonTypes, PersonActionTypes } from './types'
import { Person } from './models'

export const selectPerson = (uuid: string): PersonActionTypes => ({
  type: PersonTypes.SELECT,
  uuid,
})

export const fetchPersonList = (): PersonActionTypes => ({
  type: PersonTypes.LIST_FETCH,
})

export const fetchPersonListRequest = (): PersonActionTypes => ({
  type: PersonTypes.LIST_FETCH_REQUEST,
})

export const fetchPersonListSuccess = (persons: Person[]): PersonActionTypes => ({
  type: PersonTypes.LIST_FETCH_SUCCESS,
  persons,
})

export const fetchPersonListFailure = (error: Error): PersonActionTypes => ({
  type: PersonTypes.LIST_FETCH_FAILURE,
  error,
})

export const fetchPerson = (uuid: string): PersonActionTypes => ({
  type: PersonTypes.FETCH,
  uuid,
})

export const fetchPersonRequest = (uuid: string): PersonActionTypes => ({
  type: PersonTypes.FETCH_REQUEST,
  uuid,
})

export const fetchPersonSuccess = (person: Person): PersonActionTypes => ({
  type: PersonTypes.FETCH_SUCCESS,
  person,
})

export const fetchPersonFailure = (uuid: string, error: Error): PersonActionTypes => ({
  type: PersonTypes.FETCH_FAILURE,
  uuid,
  error,
})
