import { call, put, select, takeLatest } from 'redux-saga/effects'
import { Actions } from './actions'
import { Types } from './constants'
import { Selectors } from './selectors'
import { User } from './model'

function* selectUserSaga(action: ReturnType<typeof Actions.selectUser>) {
  const { id } = action.payload
  const shouldFetch = yield select(Selectors.shouldFetch)
  if (shouldFetch) {
    yield put(Actions.fetchUser(id))
  }
}

function* selectUserListener() {
  yield takeLatest(Types.USER_SELECT, selectUserSaga)
}

export async function fetchUsers() {
  const url = `https://api.oswee.com/users`
  const resp = await fetch(url)
  const json = await resp.json()
  return json as User[]
}

function* fetchUserListSaga(action: ReturnType<typeof Actions.fetchUserList>) {
  yield put(Actions.fetchUserListRequest())
  try {
    const users = yield call(fetchUsers)
    yield put(Actions.fetchUserListSuccess(users))
  } catch (err) {
    console.error(err)
    yield put(Actions.fetchUserListFailure(err))
  }
}

function* fetchUserListListener() {
  yield takeLatest(Types.USER_LIST_FETCH, fetchUserListSaga)
}

export async function fetchUser(id: number) {
  const url = `https://api.oswee.com/users/${id}`
  const resp = await fetch(url)
  const json = await resp.json()
  return json as User
}

function* fetchUserSaga(action: ReturnType<typeof Actions.fetchUser>) {
  const { id } = action.payload

  yield put(Actions.fetchUserRequest(id))
  try {
    const user = yield call(fetchUser, id)
    yield put(Actions.fetchUserSuccess(user))
  } catch (err) {
    console.error(err)
    yield put(Actions.fetchUserFailure(id, err))
  }
}

function* fetchUserListener() {
  yield takeLatest(Types.USER_FETCH, fetchUserSaga)
}

export default [selectUserListener, fetchUserListListener, fetchUserListener]
