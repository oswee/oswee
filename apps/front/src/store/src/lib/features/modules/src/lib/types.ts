import { IState } from './models'
import { Types } from './constants'

// ACTIONS
interface Get {
  readonly type: Types.GET
  readonly meta: object
  readonly payload: object
}

interface GetSuccess {
  readonly type: Types.GET_SUCCESS
  readonly payload: IState
}

export type ActionTypes = Get | GetSuccess
