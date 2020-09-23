import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    display: flex;
    flex-direction: column;
    /* border: 5px dotted green; */
  }
  main {
    flex: 1;
    display: flex;
    flex-direction: row;
  }
  nav {
    min-width: var(--size-l);
    box-sizing: border-box;
    font-size: 1rem;
  }
`
