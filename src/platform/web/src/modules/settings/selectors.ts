import { ISettingsAwareState } from './contracts'

export const getUserPreferences = (state: ISettingsAwareState) => state.settingsState.userPreferences
