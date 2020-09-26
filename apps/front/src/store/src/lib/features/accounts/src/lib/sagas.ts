import { call, put, takeLatest } from 'redux-saga/effects'
import { Types } from './constants'
import { fetchAccountListRequest, fetchAccountListSuccess, fetchAccountListFailure } from './actions'
import { API } from './api'

function* fetchAccountListSaga(action) {
  yield put(fetchAccountListRequest())
  try {
    const accounts = yield call(API.fetchAccounts)
    yield put(fetchAccountListSuccess(accounts))
  } catch (err) {
    console.error(err)
    yield put(fetchAccountListFailure(err))
  }
}

function* fetchAccountListListener() {
  yield takeLatest(Types.LIST_FETCH, fetchAccountListSaga)
}

export default [fetchAccountListListener]
