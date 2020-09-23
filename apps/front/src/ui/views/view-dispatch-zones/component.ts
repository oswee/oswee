import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import { store, connect, RootState, WebsocketSelectors, Application } from '../../../store'
import { Theme } from '../../../assets/style'
import template from './template'
import style from './style'
import { ViewDispatchConsignmentsElement } from '../view-dispatch-consignments'

@customElement('view-dispatch-zones')
export class ViewDispatchZonesElement extends ViewDispatchConsignmentsElement {
  @property({ type: TemplateResult }) parentTemplate: any = super.textContent
  // get parentTemplate() {
  //   return super.textContent;
  // }

  constructor() {
    super()
    this.parentTemplate = super.renderRoot
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    // console.log(Theme)
    return [super.styles, Theme, style]
  }
  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
