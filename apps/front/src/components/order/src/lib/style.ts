import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    background: green;
    color: white;
    padding: 0.5rem;
  }
`
