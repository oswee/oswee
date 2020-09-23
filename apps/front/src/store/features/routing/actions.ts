import { push, replace, go, goBack, goForward } from '../../../utils/router'
import { ActionsUnion } from '../../actions'

export const RoutingActions = {
  push,
  replace,
  go,
  goBack,
  goForward,
}

export type RoutingActions = ActionsUnion<typeof RoutingActions>
