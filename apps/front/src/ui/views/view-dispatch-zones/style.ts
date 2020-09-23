import { css } from 'lit-element'

export default css`
  :host([hidden]) {
    display: none;
  }

  :host {
    --color-base: var(--theme-color-base);
    --color-accent: var(--theme-color-accent);
    height: 100%;
    min-height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;
    background: var(--theme-color-base-130);
  }
  ui-toolbar {
    border-bottom: 0.01em solid var(--theme-color-base-100);
    padding: 0 4px;
  }
  button {
    border: none;
    background-color: var(--theme-color-base-100);
    color: var(--theme-color-base-60);
    height: 26px;
    margin-right: 5px;
    border-radius: 3px;
  }
  main {
    flex: 1;
    display: flex;
    flex-direction: row;
  }
  .container {
    flex: 1;
    margin: 4px;
    box-sizing: border-box;
  }
  .container.left {
    display: flex;
    flex-direction: column;
    margin-right: 0;
  }
  .container.left .projects {
    flex: 1;
    margin-bottom: 4px;
    border: 0.01em solid var(--theme-color-base-100, red);
  }
  .container.left .orders {
    flex: 2;
    border: 0.01em solid var(--theme-color-base-100, red);
  }
  .container.right {
    border: 0.01em solid var(--theme-color-base-100, red);
  }
  leaflet-map {
    width: 100%;
    height: 100%;
  }
`
