import { AnyAction } from 'redux'
import { eventChannel, buffers } from 'redux-saga'
import UniversalRouter from 'universal-router'
import { RoutingActions } from './actions'

import { routes } from './routes'
// import { takeEvery, call, take, put, cancelled } from 'redux-saga/effects'
import * as effects from 'redux-saga/effects'

const ROUTE_SAGAS = [...routes].map(r => ({
  ...r,
  action: (context, params) =>
    effects.call([r, r.route], params, context.queries),
}))

const sagaRouter = new UniversalRouter(ROUTE_SAGAS)

const pathnamePrev = ''

function* navigationSaga(action: AnyAction) {
  const { pathname, queries } = action.payload

  if (pathname === pathnamePrev) return

  try {
    const route = yield sagaRouter.resolve({ pathname, queries })
    if (route) {
      yield route
    }
  } catch (err) {
    // no route, ignore
  }
}

function* routingSaga() {
  yield effects.takeEvery('ROUTER/LOCATION_CHANGE', navigationSaga)
}

function clickChannel(): any {
  return eventChannel(emit => {
    const handler = (e: MouseEvent) => {
      if (
        (e.button && e.button !== 0) ||
        e.metaKey ||
        e.altKey ||
        e.ctrlKey ||
        e.shiftKey ||
        e.defaultPrevented
      ) {
        return
      }

      const anchor = e
        .composedPath()
        .filter(n => (n as HTMLElement).tagName === 'A')[0] as HTMLAnchorElement
      if (
        !anchor ||
        anchor.target ||
        anchor.hasAttribute('download') ||
        anchor.getAttribute('rel') === 'external'
      ) {
        return
      }

      const href = anchor.href
      if (!href || href.indexOf('mailto:') !== -1) {
        return
      }

      const location = window.location
      const origin = location.origin || location.protocol + '//' + location.host
      if (href.indexOf(origin) !== 0) return

      e.preventDefault()
      if (href !== location.href) {
        emit(RoutingActions.push(anchor.href.substr(origin.length)))
      }
    }

    window.document.body.addEventListener('click', handler)
    return () => document.body.removeEventListener('click', handler)
  }, buffers.fixed(1))
}

function* clickListener() {
  const channel = yield effects.call(clickChannel)

  try {
    while (true) {
      const action = yield effects.take(channel)
      yield effects.put(action)
    }
  } finally {
    if (yield effects.cancelled()) {
      channel.close()
    }
  }
}

export { routingSaga, clickListener }
