import { css } from 'lit-element'

export const Buttons = css`
  button {
    all: revert;
    padding: 0;
    box-sizing: border-box;
    border: 1px solid red;
    height: var(--theme-size-xs, 2rem);
  }
  button i {
    height: var(--theme-icon-size-m);
    width: var(--theme-icon-size-m);
    color: blue;
  }
  button > i > svg {
    height: var(--theme-icon-size-m);
    width: var(--theme-icon-size-m);
    fill: red:
  }
`
