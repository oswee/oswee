// import { routerReducer } from 'oswee/libs/router/src/index'
import { IState } from './models'
import { ActionTypes } from './types'

// export default routerReducer
export { IState }

const initialState: IState = {
  pathname: '',
  search: '',
  queries: null,
  hash: '',
}

export default (state: IState = initialState, action: ActionTypes): IState => {
  switch (action.type) {
    default:
      return state
  }
}
