import { call, put, takeLatest } from 'redux-saga/effects'
import { PersonTypes } from './types'
import { fetchPersonListRequest, fetchPersonListSuccess, fetchPersonListFailure } from './actions'
import { API } from './api'

function* fetchPersonListSaga(action) {
  yield put(fetchPersonListRequest())
  try {
    const persons = yield call(API.fetchPersons)
    yield put(fetchPersonListSuccess(persons))
  } catch (err) {
    console.error(err)
    yield put(fetchPersonListFailure(err))
  }
}

function* fetchPersonListListener() {
  yield takeLatest(PersonTypes.LIST_FETCH, fetchPersonListSaga)
}

export default [fetchPersonListListener]
