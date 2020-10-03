import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    height: 100%;
    /* border: 5px dotted green; */
    box-sizing: border-box;
  }
  #map {
    width: 100%;
    height: 100%;
    z-index: 0;
    box-sizing: border-box;
  }
`
