import { createAction, ActionsUnion } from 'oswee/libs/action/src/index'
import { User } from './model'
import { Types } from './constants'

export const Actions = {
  selectUser: (id: number) => createAction(Types.USER_SELECT, { id }),

  fetchUserList: () => createAction(Types.USER_LIST_FETCH),

  fetchUserListRequest: () => createAction(Types.USER_LIST_FETCH_REQUEST),

  fetchUserListSuccess: (users: User[]) => createAction(Types.USER_LIST_FETCH_SUCCESS, { users }),

  fetchUserListFailure: (error: Error) => createAction(Types.USER_LIST_FETCH_FAILURE, { error }),

  fetchUser: (id: number) => createAction(Types.USER_FETCH, { id }),

  fetchUserRequest: (id: number) => createAction(Types.USER_FETCH_REQUEST, { id }),

  fetchUserSuccess: (user: User) => createAction(Types.USER_FETCH_SUCCESS, { user }),

  fetchUserFailure: (id: number, error: Error) =>
    createAction(Types.USER_FETCH_FAILURE, {
      id,
      error,
      name: error.name,
      message: error.message,
      stack: error.stack,
    }),
}

export type Actions = ActionsUnion<typeof Actions>
