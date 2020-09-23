import { call, put, select, takeLatest } from 'redux-saga/effects'
import { UserTypes, UserActions } from './actions'
import { UserSelectors } from './selectors'
import { User } from './model'

function* selectUserSaga(action: ReturnType<typeof UserActions.selectUser>) {
  const { id } = action.payload
  const shouldFetch = yield select(UserSelectors.shouldFetch)
  if (shouldFetch) {
    yield put(UserActions.fetchUser(id))
  }
}

function* selectUserListener() {
  yield takeLatest(UserTypes.USER_SELECT, selectUserSaga)
}

export async function fetchUsers() {
  const url = `${window.MyApp.api}/users`
  const resp = await fetch(url)
  const json = await resp.json()
  return json as User[]
}

function* fetchUserListSaga(action: ReturnType<typeof UserActions.fetchUserList>) {
  yield put(UserActions.fetchUserListRequest())
  try {
    const users = yield call(fetchUsers)
    yield put(UserActions.fetchUserListSuccess(users))
  } catch (err) {
    console.error(err)
    yield put(UserActions.fetchUserListFailure(err))
  }
}

function* fetchUserListListener() {
  yield takeLatest(UserTypes.USER_LIST_FETCH, fetchUserListSaga)
}

export async function fetchUser(id: number) {
  const url = `${window.MyApp.api}/users/${id}`
  const resp = await fetch(url)
  const json = await resp.json()
  return json as User
}

function* fetchUserSaga(action: ReturnType<typeof UserActions.fetchUser>) {
  const { id } = action.payload

  yield put(UserActions.fetchUserRequest(id))
  try {
    const user = yield call(fetchUser, id)
    yield put(UserActions.fetchUserSuccess(user))
  } catch (err) {
    console.error(err)
    yield put(UserActions.fetchUserFailure(id, err))
  }
}

function* fetchUserListener() {
  yield takeLatest(UserTypes.USER_FETCH, fetchUserSaga)
}

export default [selectUserListener, fetchUserListListener, fetchUserListener]
