import createSagaMiddleware from 'redux-saga'
import { all, spawn, call } from 'redux-saga/effects'

// HYGEN.IO: INJECT IMPORT HERE
import route from './features/routing/src/lib/sagas'
import system from './features/system/src/lib/sagas'
import launcher from './features/launcher/src/lib/sagas'
import applications from './features/applications/src/lib/sagas'
import appModules from './features/app-navigation/src/lib/sagas'
// import organizations from './modules/organizations/src/lib/sagas'

export const rootSagas = {
  // HYGEN.IO: INJECT ROOT SAGA HERE
  route,
  system,
  launcher,
  applications,
  // organizations,
  appModules,
}

export const sagaMiddleware = createSagaMiddleware()

export async function startSagas() {
  for (const name in rootSagas) {
    const sagas = rootSagas[name]

    // eslint-disable-next-line
    function* saga(): any {
      yield all(
        sagas.map(saga =>
          spawn(function* () {
            while (true) {
              try {
                yield call(saga)
                break
              } catch (err) {
                console.error(err)
              }
            }
          }),
        ),
      )
    }

    sagaMiddleware.run(saga)
  }
}
