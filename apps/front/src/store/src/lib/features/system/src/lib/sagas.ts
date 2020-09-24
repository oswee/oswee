import { put, takeLatest, take, call, delay } from 'redux-saga/effects'

import { SystemTypes } from './types'
import { SystemActions } from './actions'
import { websocketSend } from '../websocket'

function* workerSaga(action: ReturnType<typeof SystemActions.select>) {
  // yield delay(1000)
  // yield put(websocketSend('SYSTEM__SELECT', null))
  // yield put(websocketSend('APPLICATION__GET', null))
}

function* watcherSaga() {
  // yield takeLatest(SystemTypes.SELECT, workerSaga)
  yield takeLatest(SystemTypes.LOADED, workerSaga)
}

export default [watcherSaga]
