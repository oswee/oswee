---
to: src/ui/views/<%= tag %>/component.ts
---
<%
  className = h.changeCase.pascal(tag) + 'Element'
-%>
import { LitElement, TemplateResult, CSSResultArray, property } from 'lit-element'
import template from './template'
import style from './style'

export class <%= className %> extends LitElement {
  static get is(): string {
    return '<%= tag %>'
  }
  @property({ type: Boolean, reflect: true }) selected: boolean = false
  @property({ type: Number }) key: number = 0
  @property({ type: String }) name: string = 'view'

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }

  protected createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}

declare global {
  interface HTMLElementTagNameMap {
    '<%= tag %>': <%= className %>
  }
}
