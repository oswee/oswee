import { SettingsModule } from '../settings'
import { orderReducer } from './reducer'
import { IModule } from 'redux-dynamic-modules-core'
import _ from 'redux-dynamic-modules-saga'
// import * as rdm from 'redux-dynamic-modules'
import { IOrderAwareState } from './contracts'

const _orderModule: IModule<IOrderAwareState> = {
  id: 'order',
  reducerMap: {
    orderState: orderReducer,
  } as any,
}

// The order is important, it says that settings module need to be loaded before the order module
export const OrderModules = [SettingsModule, _orderModule]
