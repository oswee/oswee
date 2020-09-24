import { AccountTypes, AccountActionTypes } from './types'
import { Account } from './models'

export const selectAccount = (uuid: string): AccountActionTypes => ({
  type: AccountTypes.SELECT,
  uuid,
})

export const fetchAccountList = (): AccountActionTypes => ({
  type: AccountTypes.LIST_FETCH,
})

export const fetchAccountListRequest = (): AccountActionTypes => ({
  type: AccountTypes.LIST_FETCH_REQUEST,
})

export const fetchAccountListSuccess = (accounts: Account[]): AccountActionTypes => ({
  type: AccountTypes.LIST_FETCH_SUCCESS,
  accounts,
})

export const fetchAccountListFailure = (error: Error): AccountActionTypes => ({
  type: AccountTypes.LIST_FETCH_FAILURE,
  error,
})

export const fetchAccount = (uuid: string): AccountActionTypes => ({
  type: AccountTypes.FETCH,
  uuid,
})

export const fetchAccountRequest = (uuid: string): AccountActionTypes => ({
  type: AccountTypes.FETCH_REQUEST,
  uuid,
})

export const fetchAccountSuccess = (account: Account): AccountActionTypes => ({
  type: AccountTypes.FETCH_SUCCESS,
  account,
})

export const fetchAccountFailure = (uuid: string, error: Error): AccountActionTypes => ({
  type: AccountTypes.FETCH_FAILURE,
  uuid,
  error,
})
