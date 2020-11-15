import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: block;
    box-sizing: border-box;
    height: 100%;
    width: 100%;
  }
  .App {
    padding: 10px;
    margin: 10px;
  }
  ui-taskbar {
    background-color: var(--color-base-20, green);
  }
`
