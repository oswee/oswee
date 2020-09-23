import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    --color-base: var(--theme-color-base, blue);
    --size-m: var(--theme-size-m, 5rem);
    display: flex;
    flex-direction: row;
    align-items: center;
    min-height: var(--size-m);
    background-color: var(--theme-color-base-110);
  }
`
