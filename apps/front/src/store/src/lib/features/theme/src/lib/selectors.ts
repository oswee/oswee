import { createSelector } from 'reselect'
import { RootState } from 'Types'
import { IState } from './reducer'

const getState = (state: RootState): IState => state.theme

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace Selectors {
  // export const getTheme = createSelector([getState], state => state.active.theme)
  export const getTheme = createSelector([getState], state => {
    return state.active === 'dark' ? state.dark : state.light
    // if (state.active === 'dark') {
    //   return state.dark
    // }
    // return state.light
  })
  // export const getAccountWidgetVisibility = createSelector([getState], launcher => launcher.isAccountWidgetDisplayed)
}
