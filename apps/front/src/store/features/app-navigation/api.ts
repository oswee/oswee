import { websocketSend } from '../websocket'

export function* fetchModules() {
  console.log('API test')
  yield
  // yield websocketSend()
}

// export const Api = {
//   fetchModules,
// }
