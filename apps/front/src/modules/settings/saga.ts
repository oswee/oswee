import { takeEvery, call, put, select } from 'redux-saga/effects'
// import { effects } from 'redux-saga'
import { SettingActions, SettingsActionTypes } from './actions'
import { ISettingsAwareState, ISettingsState } from './contracts'

export function* settingsRootSaga() {
  if (typeof Storage === 'undefined') {
    return
  }

  yield takeEvery(SettingsActionTypes.LOAD_PREFERENCES, loadPreferences)
  // Watch for every set preference and store in the local storage
  yield takeEvery(SettingsActionTypes.SET_PREFERENCES, storePreferencs)
}

function* loadPreferences() {
  // Load the current state
  const settingsStr = yield call([localStorage, localStorage.getItem], 'userPreferences')
  if (settingsStr) {
    const settings = JSON.parse(settingsStr)
    yield put(SettingActions.setPreferences(settings))
  }
}

function* storePreferencs() {
  const settingsState: ISettingsState = yield select((state: ISettingsAwareState) => state.settingsState)
  yield call([localStorage, localStorage.setItem], 'userPreferences', JSON.stringify(settingsState.userPreferences))
}
