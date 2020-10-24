import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    border: 3px solid green;
  }
  ui-avatar {
    color: red;
    font-size: 2rem;
  }
`
