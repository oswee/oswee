import { LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement } from 'lit/decorators.js'
import template from './template'
import style from './style'

@customElement('ui-taskbar')
export class UiTaskbarComponent extends LitElement {
	protected override render(): TemplateResult {
		return template.call(this)
	}

	public static override get styles(): CSSResultArray {
		return [style]
	}
}
