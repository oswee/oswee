import { LitElement, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import template from './template'
import style from './style'

@customElement('app-signup')
export class AppSignupElement extends LitElement {
  get userFullNameInput() {
    return this.shadowRoot.getElementById('customer_name') as HTMLInputElement
  }

  get userEmailInput() {
    return this.shadowRoot.getElementById('email') as HTMLInputElement
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
