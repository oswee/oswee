import { LitElement, customElement, property, TemplateResult } from 'lit-element'
import template from './template'
import style from './style'

@customElement('view-error')
export class ViewErrorElement extends LitElement {
  public static styles = [style]
  @property({ type: Boolean, reflect: true }) selected: boolean = false
  @property({ type: Number }) key: number = 0
  @property({ type: String }) name: string = 'view-error'

  onButtonClick(): void {
    const evt = new CustomEvent('view-error-click', {
      bubbles: true,
      composed: true,
      detail: {
        key: this.key,
        name: this.name,
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

  protected render(): TemplateResult {
    return template.call(this)
  }
}

declare global {
  interface DocumentEventMap {
    'view-error-click': CustomEvent<ViewErrorData>
  }

  interface HTMLElementTagNameMap {
    'view-error': ViewErrorElement
  }
}

export interface ViewErrorData {
  key: number
  name: string
}
