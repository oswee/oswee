import { css } from 'lit'

export default css`
  :host([hidden]) {
    display: none;
  }

  :host {
    display: block;
  }

  .news-root {
    display: flex;
    flex-direction: column;
    text-align: left;
  }

  .news-link {
    margin-top: 2px;
  }
`
