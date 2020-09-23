import { put } from 'redux-saga/effects'

import { UserActions } from '../users'
import { websocketConnect } from '../websocket'
// import { fetchApplicationList, getApplications } from '../applications'
// import { fetchModulesList } from '../app-navigation'

function* homeRoute(params, queries) {
  // Get list of the applications from the
  yield put(websocketConnect('wss://api.oswee.com'))
  // yield put(getApplications())
  // yield put(getModules())
}

function* userListRoute(params, queries) {
  console.log('Users Hit')
  yield put(UserActions.fetchUserList())
}

function* userRoute(params, queries) {
  const { id } = params
  yield put(UserActions.selectUser(parseInt(id)))
}

// function* applicationListRoute(params, queries) {
//   console.log('Dispatch route hit!')
//   yield put(fetchModulesList())
//   // yield put(getApplications())
//   // yield put(getModules())
// }

export const routes = [
  // { path: '/', route: homeRoute },
  // { path: '/users', route: userListRoute },
  // { path: '/users/:id', route: userRoute },
  // { path: '/dispatch', route: applicationListRoute },
]
