// import { Signin } from './models'

export enum SigninTypes {
  DISPLAY = 'SIGNIN_DISPLAY',
  DISPLAYED = 'SIGNIN_DISPLAYED',
}

interface DisplaySigninAction {
  readonly type: SigninTypes.DISPLAY
  readonly meta: object
}

interface SigninDisplayedAction {
  readonly type: SigninTypes.DISPLAYED
  readonly meta: object
}

export type SigninActionTypes = DisplaySigninAction | SigninDisplayedAction
