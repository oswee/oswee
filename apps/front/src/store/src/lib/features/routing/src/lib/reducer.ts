import { routerReducer } from 'oswee/libs/router/src/index'

export interface RoutingState {
  pathname: string
  search: string
  queries: any
  hash: string
}

export default routerReducer
