export enum ThemeTypes {
  SWITCH = 'THEME_SWITCH',
}

interface SwitchThemeAction {
  readonly type: ThemeTypes.SWITCH
  readonly meta: object
  readonly payload: object
}

export type ThemeActionTypes = SwitchThemeAction
