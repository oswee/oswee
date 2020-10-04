import { StringMap } from '@oswee/libs/action'

export interface ISettingsAwareState {
  settingsState: ISettingsState
}

export interface ISettingsState {
  userPreferences: StringMap<string | boolean>
}
