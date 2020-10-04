import { ISettingsState } from './contracts'
import produce from 'immer'
import { SettingsActionTypes, SettingActionsUnion } from './actions'

export function settingsReducer(state: ISettingsState, action: SettingActionsUnion): ISettingsState {
  return produce(state || { userPreferences: {} }, (draft: ISettingsState) => {
    switch (action.type) {
      case SettingsActionTypes.SET_PREFERENCES: {
        const { map } = action.payload
        for (const key in map) {
          /*eslint no-prototype-builtins: "off"*/
          if (map.hasOwnProperty(key)) {
            draft.userPreferences[key] = map[key]
          }
        }
        break
      }
    }
  })
}
