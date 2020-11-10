import { call } from 'redux-saga/effects'

export default (helper, actionCriteria, saga) =>
  function* () {
    yield helper(actionCriteria, function* (action) {
      yield call(saga, action.payload)
    })
  }
