import { css } from 'lit-element'

export default css`
  :host {
    display: block;
    width: 100%;
    height: 100%;
  }

  :host([hidden]) {
    display: none;
  }
`
