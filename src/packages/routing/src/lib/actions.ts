import { push, replace, go, goBack, goForward } from 'redux-first-routing'
import { ActionsUnion } from '@oswee/lib/action'

export const RoutingActions = {
  push,
  replace,
  go,
  goBack,
  goForward,
}

export type RoutingActions = ActionsUnion<typeof RoutingActions>
