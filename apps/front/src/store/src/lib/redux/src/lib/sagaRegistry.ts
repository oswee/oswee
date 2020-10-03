import { Saga } from 'redux-saga'

export class SagaRegistry {
  emitChange: any

  sagas: { [name: string]: Saga }

  constructor() {
    this.emitChange = null
    this.sagas = {}
  }

  getSagas() {
    return { ...this.sagas }
  }

  register(saga: Saga) {
    if (this.sagas[saga.name]) {
      return
    }
    this.sagas = { ...this.sagas, [saga.name]: saga }
    if (this.emitChange) {
      this.emitChange(saga)
    }
  }

  setChangeListener(listener: any) {
    this.emitChange = listener
  }
}

export const sagaRegistry = new SagaRegistry()
