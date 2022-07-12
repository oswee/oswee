import { LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement, property } from 'lit/decorators.js'
import template from './template'
import style from './style'

@customElement('ui-avatar')
export class UiAvatarElement extends LitElement {
	@property({ type: Boolean, reflect: true }) selected = false
	@property({ type: Number }) key = 0
	@property({ type: String }) src = ''
	@property({ type: String }) alt = ''
	@property({ type: String }) text = ''

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

	override connectedCallback(): void {
		super.connectedCallback()
		// console.log('Avatar element connected!')
		this.addEventListener('click', this.onButtonClick)
	}

	override disconnectedCallback(): void {
		super.disconnectedCallback()
		this.removeEventListener('click', this.onButtonClick)
	}

	protected override render(): TemplateResult {
		// this.text = this.textContent
		return template.call(this)
	}

	public static override get styles(): CSSResultArray {
		return [style]
	}

	override createRenderRoot(): Element | ShadowRoot {
		return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
	}
}

// declare global {
//   interface DocumentEventMap {
//     'ui-avatar-click': CustomEvent<UiAvatarData>
//   }

//   interface HTMLElementTagNameMap {
//     'ui-avatar': UiAvatarElement
//   }
// }

export interface UiAvatarData {
	key: number
	src: string
	alt: string
	text: string
}
