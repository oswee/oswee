import { css } from 'lit-element'

export default css`
  * {
    box-sizing: border-box;
  }
  :host {
    display: flex;
    overflow: hidden;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }

  img {
    color: transparent;
    width: 100%;
    height: 100%;
    object-fit: cover;
    text-align: center;
    text-indent: 10000px;
  }

  // :host([selected]) {
  //   background-color: var(--color-success-1l);
  //   border-color: #339933;
  // }

  // :host(:hover) {
  //   background-color: var(--color-gray-40);
  //   box-shadow: var(--shadow-8);
  // }

  // :host([selected]:hover) {
  //   background-color: var(--color-success);
  //   box-shadow: var(--shadow-8);
  // }

  // :host(:focus),
  // :host(:focus-within) {
  //   outline-style: ridge;
  //   outline-color: var(--color-dodgerblue-6l);
  // }
`
