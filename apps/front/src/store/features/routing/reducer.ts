import { routerReducer } from '../../../utils/router'

export interface RoutingState {
  pathname: string
  search: string
  queries: any
  hash: string
}

export default routerReducer
