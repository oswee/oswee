// / <reference path="../../../../types/index.d.ts"/>
import { createSelector } from 'reselect'
import { RootState } from '../../../../reducer' // Original import
// import { RootState } from 'MyTypes'
// import { RootState } from '../../../../../types'
import { IState } from './reducer'

const getState = (state: RootState): IState => state.websocket

// TODO: Refactor namespace
//eslint-disable-next-line @typescript-eslint/no-namespace
export namespace Selectors {
  export const state = createSelector([getState], state => state.state)
  export const selectConnectedState = createSelector([getState], state => state.connected)
}
