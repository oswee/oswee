import { LitElement, customElement, property, TemplateResult } from 'lit-element'
import template from './template'
import style from './style'

@customElement('ui-avatar')
export class UiAvatarElement extends LitElement {
  public static styles = [style]
  @property({ type: Boolean, reflect: true }) selected: boolean = false
  @property({ type: Number }) key: number = 0
  @property({ type: String }) src: string = ''
  @property({ type: String }) alt: string = ''
  @property({ type: String }) text: string = ''

  onButtonClick(): void {
    const evt = new CustomEvent('ui-avatar-click', {
      bubbles: true,
      composed: true,
      detail: {
        key: this.key,
        name: this.src,
      },
    })
    this.dispatchEvent(evt)
    // this.focus()
  }

  // onHostClick(): void {
  //   const event = new CustomEvent('launcher-click', {
  //     bubbles: true,
  //     composed: true,
  //     detail: { key: 'Test' },
  //   })
  //   this.dispatchEvent(event)
  // }

  connectedCallback(): void {
    super.connectedCallback()
    this.addEventListener('click', this.onButtonClick)
  }

  disconnectedCallback(): void {
    super.disconnectedCallback()
    this.removeEventListener('click', this.onButtonClick)
  }

  protected render(): TemplateResult {
    this.text = this.textContent
    return template.call(this)
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface DocumentEventMap {
    'ui-avatar-click': CustomEvent<UiAvatarData>
  }

  interface HTMLElementTagNameMap {
    'ui-avatar': UiAvatarElement
  }
}

export interface UiAvatarData {
  key: number
  src: string
  alt: string
  text: string
}
