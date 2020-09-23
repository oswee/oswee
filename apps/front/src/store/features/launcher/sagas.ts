import { put, takeLatest, take, call, delay } from 'redux-saga/effects'
import { LauncherTypes } from './types'
import { LauncherActions } from './actions'
import { WebsocketActions } from '../websocket'

function* workerSaga(action) {
  // const { id } = action.payload.appid
  console.log('Launcher worker hit:', action.payload)
  // yield put({ ...action, type: `REMOTE_${action.type}` })
  // TODO: No no!
  // yield delay(1000)
  yield put(WebsocketActions.SendRpc('ApplicationsService', 'ListApplicationsRequest', {}))
}

function* watcherSaga() {
  yield takeLatest(LauncherTypes.DISPLAY, workerSaga)
}

export default [watcherSaga]
