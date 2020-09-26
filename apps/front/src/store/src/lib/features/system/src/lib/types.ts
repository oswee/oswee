import { Types } from './constants'
import { IState } from './models'

interface Select {
  readonly type: Types.SELECT
  readonly payload: {
    id: string
  }
}

interface Loaded {
  readonly type: Types.LOADED
}

export type ActionTypes = Select | Loaded
