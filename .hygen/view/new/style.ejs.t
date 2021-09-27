---
to: src/ui/views/<%= tag %>/style.ts
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
