import { ActionTypes } from './types'
import { Types } from './constants'
// import { Signin } from './models'

export const displaySignin = (): ActionTypes => ({
  type: Types.DISPLAY,
  meta: { websocket: true },
})

export const displaySigninSuccess = (): ActionTypes => ({
  type: Types.DISPLAYED,
  meta: { websocket: true },
})
