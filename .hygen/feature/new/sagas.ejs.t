---
to: src/store/features/<%= feature %>/sagas.ts
---
<%
  featureTypes = h.changeCase.pascal(feature) + 'Types'
  featureActions = h.changeCase.pascal(feature) + 'Actions'
  featureActionTypes = h.changeCase.pascal(feature) + 'ActionTypes'
  featureState = h.changeCase.pascal(feature) + 'State'
  featureUpcase = h.changeCase.constantCase(feature)
-%>
import { put, takeLatest, take, call, delay } from 'redux-saga/effects'
import { <%= featureTypes %> } from './types'
import { <%= featureActions %> } from './actions'
import { websocketSend } from '../websocket'

function* workerSaga(action: ReturnType<typeof <%= featureActions %>.select>) {
  yield delay(1000)
  yield put(websocketSend('<%= featureUpcase %>__SELECT', null))
}

function* watcherSaga() {
  yield takeLatest(<%= featureTypes %>.SELECT, workerSaga)
}

export default [watcherSaga]
