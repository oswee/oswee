---
to: src/ui/components/<%= tag %>/style.ts
---
import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
  }
`
