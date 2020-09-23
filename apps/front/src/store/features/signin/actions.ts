import { SigninTypes, SigninActionTypes } from './types'
// import { Signin } from './models'

export const displaySignin = (): SigninActionTypes => ({
  type: SigninTypes.DISPLAY,
  meta: { websocket: true },
})

export const displaySigninSuccess = (): SigninActionTypes => ({
  type: SigninTypes.DISPLAYED,
  meta: { websocket: true },
})
