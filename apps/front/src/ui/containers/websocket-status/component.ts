import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import { store, connect, RootState, WebsocketSelectors } from '../../../store'

import template from './template'
import style from './style'

@customElement('websocket-status' as any)
export class WebsocketStatusElement extends connect(store, LitElement) {
  @property({ type: String }) websocketState: string = WebsocketSelectors.state.toString()

  mapState(state: RootState) {
    return {
      websocketState: WebsocketSelectors.state(state),
    }
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'websocket-status': WebsocketStatusElement
  }
}
