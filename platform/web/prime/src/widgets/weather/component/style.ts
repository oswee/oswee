import { css } from 'lit'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    border: 3px solid red;
  }
  .weather-root {
    display: flex;
    flex-direction: column;
    text-align: left;
  }
`
