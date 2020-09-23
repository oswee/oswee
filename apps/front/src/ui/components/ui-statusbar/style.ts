import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }

  :host {
    display: flex;
    flex-direction: row;
  }
  .left {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .middle {
    flex: 1;
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .right {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
`
