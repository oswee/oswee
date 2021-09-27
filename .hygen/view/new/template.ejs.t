---
to: src/ui/views/<%= tag %>/template.ts
---
<%
  className = h.changeCase.pascal(tag) + 'Element'
-%>
import { html, TemplateResult } from 'lit-element'
import { <%= className %> } from './component'

export default function template(this: <%= className %>): TemplateResult {
  return html`
    <p>Hello from <strong><%= tag %></strong> ${this.name}</p>
    <a href="/">Home</a>
  `
}
