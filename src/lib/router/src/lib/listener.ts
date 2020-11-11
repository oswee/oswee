import { locationChange } from './actions'

export function startListener(history: any, store: any) {
  store.dispatch(
    locationChange({
      pathname: history.location.pathname,
      search: history.location.search,
      hash: history.location.hash,
    }),
  )

  history.listen((location: any) => {
    store.dispatch(
      locationChange({
        pathname: location.pathname,
        search: location.search,
        hash: location.hash,
      }),
    )
  })
}
