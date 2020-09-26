import { Types } from './constants'
// import { Signin } from './models'

interface DisplaySigninAction {
  readonly type: Types.DISPLAY
  readonly meta: object
}

interface SigninDisplayedAction {
  readonly type: Types.DISPLAYED
  readonly meta: object
}

export type ActionTypes = DisplaySigninAction | SigninDisplayedAction
