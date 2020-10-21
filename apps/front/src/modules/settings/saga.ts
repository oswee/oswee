// import { takeEvery, call, put, select } from 'redux-saga/effects'
import * as effects from 'redux-saga/effects'
import { SettingActions, SettingsActionTypes } from './actions'
import { ISettingsAwareState, ISettingsState } from './contracts'

export function* settingsRootSaga() {
  if (typeof Storage === 'undefined') {
    return
  }

  yield effects.takeEvery(SettingsActionTypes.LOAD_PREFERENCES, loadPreferences)
  // Watch for every set preference and store in the local storage
  yield effects.takeEvery(SettingsActionTypes.SET_PREFERENCES, storePreferencs)
}

function* loadPreferences() {
  // Load the current state
  const settingsStr = yield effects.call([localStorage, localStorage.getItem], 'userPreferences')
  console.log('Saga')
  if (settingsStr) {
    const settings = JSON.parse(settingsStr)
    yield effects.put(SettingActions.setPreferences(settings))
  }
}

function* storePreferencs() {
  const settingsState: ISettingsState = yield effects.select((state: ISettingsAwareState) => state.settingsState)
  yield effects.call(
    [localStorage, localStorage.setItem],
    'userPreferences',
    JSON.stringify(settingsState.userPreferences),
  )
}
