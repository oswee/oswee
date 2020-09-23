import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('sign-up')
export class SignUpElement extends LitElement {
  get userFullNameInput() {
    return this.shadowRoot.getElementById('user_name') as HTMLInputElement
  }

  get userEmailInput() {
    return this.shadowRoot.getElementById('user_email') as HTMLInputElement
  }

  get userPasswordInput() {
    return this.shadowRoot.getElementById('password') as HTMLInputElement
  }

  get userFullName() {
    // Use the input getter, and get the value property from the input element
    return this.userFullNameInput.value
  }

  get userEmail() {
    // Use the input getter, and get the value property from the input element
    return this.userEmailInput.value
  }

  get userPassword() {
    // Use the input getter, and get the value property from the input element
    return this.userPasswordInput.value
  }

  onSignIn(): void {
    const evt = new CustomEvent('sign-in-click', {
      bubbles: true,
      composed: true,
    })
    this.dispatchEvent(evt)
  }

  connectedCallback() {
    super.connectedCallback()
    this.userFullNameInput.focus()
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
    // 'sign-up-click': CustomEvent<SignUpData>
    'sign-in-click': CustomEvent<SignUpData>
  }

  interface HTMLElementTagNameMap {
    'sign-up': SignUpElement
  }
}

export interface SignUpData {
  key: number
  name: string
}
