---
to: src/ui/components/<%= tag %>/template.ts
---
<%
  className = h.changeCase.pascal(tag) + 'Element'
-%>
import { html, TemplateResult } from 'lit-element'
import { <%= className %> } from './component'

export default function template(this: <%= className %>): TemplateResult {
  return html`
    <p>Hello from ${this.name}</p>
  `
}
