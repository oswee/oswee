import { put, takeLatest, take, call, delay } from 'redux-saga/effects'
import { AppNavigationTypes } from './constants'
import { ModxActions } from './actions'
import { WebsocketActions } from '../websocket'
import { ListModulesRequest } from '@dzintars/npm-test-pkg'

function* workerSaga(action) {
  // const { id } = action.payload.appid
  // console.log('Worker hit', action.payload.appid)
  // yield put({ ...action, type: `REMOTE_${action.type}` })
  // TODO: No no!
  // yield delay(1000)

  /**
   * Ideally message payload shape should be defined in protobufs and
   * shared between backend and frontend.
   */
  const listModulesRequestPayload: ListModulesRequest.AsObject = {
    parent: action.payload.appid,
  }
  yield put(WebsocketActions.SendRpc('ModulesService', 'ListModulesRequest', listModulesRequestPayload))
}

function* watcherSaga() {
  yield takeLatest(AppNavigationTypes.LOADED, workerSaga)
}

export default [watcherSaga]
