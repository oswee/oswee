// import { call, put, takeLatest } from 'redux-saga/effects'
// import { OrganizationTypes } from './types'
// import { fetchOrganizationListRequest, fetchOrganizationListSuccess, fetchOrganizationListFailure } from './actions'
// import { API } from './api'

// function* fetchOrganizationListSaga(action) {
//   yield put(fetchOrganizationListRequest())
//   try {
//     const organizations = yield call(API.fetchOrganizations)
//     yield put(fetchOrganizationListSuccess(organizations))
//   } catch (err) {
//     console.error(err)
//     yield put(fetchOrganizationListFailure(err))
//   }
// }

// function* fetchOrganizationListListener() {
//   yield takeLatest(OrganizationTypes.LIST_FETCH, fetchOrganizationListSaga)
// }

// export default [fetchOrganizationListListener]
