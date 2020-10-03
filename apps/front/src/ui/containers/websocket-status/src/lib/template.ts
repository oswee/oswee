import { html, TemplateResult } from 'lit-element'

export default function template(): TemplateResult {
  switch (this.websocketState) {
    case 'WEBSOCKET_CONNECTING':
      return html` <div style="background-color: orange;"><p style="color: white;">Connecting...</p></div> `
    case 'WEBSOCKET_CONNECTED':
      return html`
        <div style="background-color: hsla(101, 100%, 38%, 1);"><p style="color: white;">Connected</p></div>
      `
    default:
      return html` <div style="background-color: red;"><p style="color: white;">Disconnected</p></div> `
  }
}
