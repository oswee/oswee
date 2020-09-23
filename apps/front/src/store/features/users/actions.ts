import { createAction, ActionsUnion } from '../../actions'
import { User } from './model'

export enum UserTypes {
  USER_SELECT = 'USER_SELECT',

  USER_LIST_FETCH = 'USER_LIST_FETCH',
  USER_LIST_FETCH_REQUEST = 'USER_LIST_FETCH_REQUEST',
  USER_LIST_FETCH_SUCCESS = 'USER_LIST_FETCH_SUCCESS',
  USER_LIST_FETCH_FAILURE = 'USER_LIST_FETCH_FAILURE',

  USER_FETCH = 'USER_FETCH',
  USER_FETCH_REQUEST = 'USER_FETCH_REQUEST',
  USER_FETCH_SUCCESS = 'USER_FETCH_SUCCESS',
  USER_FETCH_FAILURE = 'USER_FETCH_FAILURE',
}

export const UserActions = {
  selectUser: (id: number) => createAction(UserTypes.USER_SELECT, { id }),

  fetchUserList: () => createAction(UserTypes.USER_LIST_FETCH),

  fetchUserListRequest: () => createAction(UserTypes.USER_LIST_FETCH_REQUEST),

  fetchUserListSuccess: (users: User[]) => createAction(UserTypes.USER_LIST_FETCH_SUCCESS, { users }),

  fetchUserListFailure: (error: Error) => createAction(UserTypes.USER_LIST_FETCH_FAILURE, { error }),

  fetchUser: (id: number) => createAction(UserTypes.USER_FETCH, { id }),

  fetchUserRequest: (id: number) => createAction(UserTypes.USER_FETCH_REQUEST, { id }),

  fetchUserSuccess: (user: User) => createAction(UserTypes.USER_FETCH_SUCCESS, { user }),

  fetchUserFailure: (id: number, error: Error) =>
    createAction(UserTypes.USER_FETCH_FAILURE, {
      id,
      error,
      name: error.name,
      message: error.message,
      stack: error.stack,
    }),
}

export type UserActions = ActionsUnion<typeof UserActions>
