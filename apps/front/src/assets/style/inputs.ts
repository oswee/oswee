import { css } from 'lit-element'

export const Inputs = css`
  * {
    box-sizing: border-box;
  }

  input[type='text'],
  input[type='password'] {
    border: 1px solid var(--color-dodgerblue-6l);
    background-color: var(--color-dodgerblue-10l, hsla(215, 100%, 95%, 1));
  }

  input[type='text']:focus,
  input[type='password']:focus {
    border: 1px solid var(--color-dodgerblue-main);
  }

  input[type='submit'] {
    border: none;
  }
`
