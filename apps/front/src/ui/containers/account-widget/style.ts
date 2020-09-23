import { css } from 'lit-element'

export default css`
  * {
    box-sizing: border-box;
  }
  :host {
    display: block;
    box-sizing: border-box;
    border: 1px solid var(--color-gray-40);
    border-radius: 6px;
    background: var(--color-white);
    box-shadow: var(--shadow-4);
    padding: 1rem;
  }

  ui-card {
    height: 3rem;
  }

  ui-card a {
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
    height: 100%;
    width: 100%;
  }
`
