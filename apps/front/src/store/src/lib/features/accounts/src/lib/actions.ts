import { ActionTypes } from './types'
import { Types } from './constants'
import { Account } from './models'

export const selectAccount = (uuid: string): ActionTypes => ({
  type: Types.SELECT,
  uuid,
})

export const fetchAccountList = (): ActionTypes => ({
  type: Types.LIST_FETCH,
})

export const fetchAccountListRequest = (): ActionTypes => ({
  type: Types.LIST_FETCH_REQUEST,
})

export const fetchAccountListSuccess = (accounts: Account[]): ActionTypes => ({
  type: Types.LIST_FETCH_SUCCESS,
  accounts,
})

export const fetchAccountListFailure = (error: Error): ActionTypes => ({
  type: Types.LIST_FETCH_FAILURE,
  error,
})

export const fetchAccount = (uuid: string): ActionTypes => ({
  type: Types.FETCH,
  uuid,
})

export const fetchAccountRequest = (uuid: string): ActionTypes => ({
  type: Types.FETCH_REQUEST,
  uuid,
})

export const fetchAccountSuccess = (account: Account): ActionTypes => ({
  type: Types.FETCH_SUCCESS,
  account,
})

export const fetchAccountFailure = (uuid: string, error: Error): ActionTypes => ({
  type: Types.FETCH_FAILURE,
  uuid,
  error,
})
