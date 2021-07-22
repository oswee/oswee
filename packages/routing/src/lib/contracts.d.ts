export interface IRoutingRootState {
  readonly routingState: IRoutingState
}

export interface IRoutingState {
  readonly pathname: string
  readonly search: string
  readonly queries: any
  readonly hash: string
}
