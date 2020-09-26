import { push, replace, go, goBack, goForward } from 'oswee/libs/router/src/index'
import { ActionsUnion } from 'oswee/libs/action/src/index'

export const RoutingActions = {
  push,
  replace,
  go,
  goBack,
  goForward,
}

export type RoutingActions = ActionsUnion<typeof RoutingActions>
