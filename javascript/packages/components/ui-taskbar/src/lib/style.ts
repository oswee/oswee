import { css } from 'lit'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    /* border: 5px dotted green; */
  }
`
