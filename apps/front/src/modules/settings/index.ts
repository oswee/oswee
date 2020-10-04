import { ISettingsAwareState } from './contracts'
import { ISagaModule } from 'redux-dynamic-modules-saga'
import { settingsReducer } from './reducer'
import { settingsRootSaga } from './saga'
import { SettingActions } from './actions'

export const SettingsModule: ISagaModule<ISettingsAwareState> = {
  id: 'settings',
  reducerMap: {
    settingsState: settingsReducer,
  } as any,
  initialActions: [SettingActions.loadPreferences()],
  sagas: [settingsRootSaga],
}
