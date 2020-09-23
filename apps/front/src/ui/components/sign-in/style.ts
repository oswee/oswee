import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
    height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
  }
  /* .container {
    width: 320px;
    border: 1px solid var(--main-background);
    padding: var(--size-xs);
    border-radius: 5px;
    box-shadow: 0 11px 15px -7px rgba(0, 0, 0, 0.2), 0 24px 38px 3px rgba(0, 0, 0, 0.14),
      0 9px 46px 8px rgba(0, 0, 0, 0.12);
    background: var(--lt-color-light);
    margin: 2rem;
    color: var(--theme-color-primary-10d);
  }
  .fieldset {
    display: flex;
    flex-direction: column;
    margin-bottom: 1.1rem;
  }
  label {
    font-size: var(--text-md);
    font-weight: 500;
  }
  input {
    height: 2rem;
    width: 100%;
    border-radius: 3px;
    background: var(--main-background);
    border: 1px solid var(--main-background);
    padding: 0 6px;
    outline: none;
    box-sizing: border-box;
  }
  input:focus {
    border: 1px solid var(--lt-color-primary, hsl(215 100% 50%));
  }
  #continue {
    color: white;
    background-color: var(--lt-color-primary, hsl(215 100% 50%));
    font-family: var(--font-main);
    font-size: var(--text-md);
    margin-top: 1.1rem;
    cursor: pointer;
  }
  p {
    margin: 0;
    font-size: var(--text-sm);
  }
  .have-account {
    font-size: var(--text-md);
    font-weight: 500;
  }
  .have-account a {
    text-decoration: none;
  }
  h1,
  p,
  input,
  label {
    color: var(--lt-color-light-10d);
  }
  h1 {
    margin-top: 0;
  }
  a {
    color: var(--lt-color-primary);
  }
  @media only screen and (max-width: 600px) {
    .container {
      width: 280px;
    }
  } */
`
