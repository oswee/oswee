import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('nav-item')
export class NavItemElement extends LitElement {
  @property({ type: String }) key: string = ''
  @property({ type: String }) label: string = 'Unspecified label'
  @property({ type: String }) permalink: string = '/'

  constructor() {
    super()
    this.addEventListener('click', this.onHostClick)
    this.addEventListener('mouseenter', this.onHostMouseEnter)
  }

  onHostClick(): void {
    const evt = new CustomEvent('nav-item-click', {
      bubbles: true,
      composed: true,
      detail: {
        key: this.key,
        label: this.label,
        permalink: this.permalink,
      },
    })
    this.dispatchEvent(evt)
  }

  onHostMouseEnter(): void {
    const evt = new CustomEvent('nav-item-enter', {
      bubbles: true,
      composed: true,
      detail: {
        key: this.key,
        label: this.label,
        permalink: this.permalink,
      },
    })
    this.dispatchEvent(evt)
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface DocumentEventMap {
    'nav-item-click': CustomEvent<NavItemElementData>
    'nav-item-mouseover': CustomEvent<NavItemElementData>
  }

  interface HTMLElementTagNameMap {
    'nav-item': NavItemElement
  }
}

export interface NavItemElementData {
  key: string
  label: string
  permalink: string
}
