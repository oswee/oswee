import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
  }
  .weather-root {
    display: flex;
    flex-direction: column;
    text-align: left;
  }
`
