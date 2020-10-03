import { css } from 'lit-element'

export default css`
  * {
    box-sizing: border-box;
  }
  :host {
    display: flex;
    flex-direction: row;
  }

  span {
    line-height: 1;
  }

  svg {
    stroke: black;
    fill: white;
  }
`
