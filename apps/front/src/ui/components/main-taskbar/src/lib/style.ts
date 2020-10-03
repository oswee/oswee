import { css } from 'lit-element'

export default css`
  :host {
    display: flex;
    flex-direction: row;
    align-items: center;
    background: var(--color-gray-60);
    border-bottom: 1px solid var(--color-gray-70);
    color: var(--color-gray-210);
    margin: 0;
    box-shadow: var(--shadow-8);
    box-sizing: border-box;
  }
  ul {
    text-align: center;
  }
  ul li {
    display: inline-block;
  }
  a {
    color: var(--color-gray-210);
    padding-left: 10px;
  }
  button {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    height: var(--size-sl);
    width: var(--size-sl);
    background-color: var(--color-gray-60);
    border: none;
    outline: none;
  }
  button:hover {
    background-color: var(--color-gray-70);
  }
  button:active {
    background-color: var(--color-gray-80);
  }
  svg {
    width: 2rem;
    height: 2rem;
  }
  svg .primary {
    stroke: red;
  }

  main-taskbar {
    height: var(--size-sl, 48px);
    min-height: var(--size-sl, 48px);
    z-index: 1;
  }

  nav {
    display: flex;
    flex-direction: row;
    align-items: center;
    min-height: var(--size-xxl);
    box-sizing: border-box;
    /* border: 1px solid dodgerblue; */
    box-shadow: var(--shadow-8);
    background-color: var(--color-gray-10);
  }

  .main-area {
    flex: 1;
    display: flex;
    flex-direction: row;
  }

  .logo {
    height: var(--size-sl);
    margin: 0 2rem;
  }

  .logo svg {
    height: var(--size-sl);
    width: auto;
    border: none;
  }

  ul {
    text-align: center;
    margin: 0;
    display: flex;
    align-items: center;
  }

  ul li {
    display: inline-block;
    margin-right: 0.5rem;
    padding: 0.4rem 0.6rem;
    border-radius: 3px;
  }

  ul li:hover {
    background-color: var(--color-gray-30, dodgerblue);
    padding: 0.4rem 0.6rem;
    cursor: pointer;
  }

  .actions {
    padding: 0 2rem;
  }

  .btn {
    height: var(--size-s);
    width: var(--size-s);
    margin: 0 0.5rem;
    padding: 0;
    /* color: var(--color-dodgerblue-main); */
    background-color: unset;
    border-radius: 50%;
    border: none;
    box-shadow: var(--shadow-8);
    outline: unset;
  }

  .btn svg {
    width: 100%;
    height: 100%;
    border: none;
  }

  .btn svg .main {
    stroke: var(--color-gray-100);
    fill: var(--color-gray-100);
  }

  .btn:hover svg .main {
    stroke: var(--color-dodgerblue-main);
    fill: var(--color-dodgerblue-main);
  }

  .btn:hover {
    box-shadow: var(--shadow-16);
  }
`
