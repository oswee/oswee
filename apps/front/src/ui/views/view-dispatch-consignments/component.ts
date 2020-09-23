import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import { store, connect, RootState, WebsocketSelectors, Application, startApplication } from '../../../store'
import { Theme } from '../../../assets/style'
import template from './template'
import style from './style'

@customElement('view-dispatch-consignments')
export class ViewDispatchConsignmentsElement extends connect(store, LitElement) {
  // public static styles = [Theme, style]
  @property({ type: String }) websocketState: string = WebsocketSelectors.state.toString()
  @property({ type: Object }) applications: { [uuid: string]: Application } = {}
  @property({ type: String }) appid: string = '54789c07-bb43-4db4-8b2d-1a8e1f8c67f1'

  mapState(state: RootState) {
    return {
      websocketState: WebsocketSelectors.state(state),
    }
  }
  connectedCallback() {
    super.connectedCallback()
    store.dispatch(startApplication(this.appid))
    // store.dispatch(getApplications())
    // store.dispatch(getModules())
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    // console.log(Theme)
    return [Theme, style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
