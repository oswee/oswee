import { LitElement, customElement, property, TemplateResult } from 'lit-element'
// import { connect } from '@captaincodeman/redux-connect-element'
import { connect } from '../../../utils/connect'
import { store, RootState, Application, ApplicationSelectors, LauncherActions, getApplications } from '../../../store'
import template from './template'
import style from './style'

@customElement('main-taskbar')
export class MainTaskbarElement extends connect(store, LitElement) {
  @property({ type: Array }) applications: Application[]
  @property({ type: String }) selected: string

  mapState(state: RootState) {
    return {
      applications: ApplicationSelectors.selectAllApplications(state),
      selected: ApplicationSelectors.selectSelectedApplication(state),
    }
  }

  displayLauncher(): void {
    store.dispatch(LauncherActions.displayLauncher())
    store.dispatch(getApplications())
  }

  toggleAccountWidget(): void {
    console.log('There X')
  }

  onButtonClick(): void {
    const event = new CustomEvent('launcher-click', {
      bubbles: true,
      composed: true,
      detail: {},
    })
    this.dispatchEvent(event)
  }

  public static styles = [style]

  protected render(): TemplateResult {
    return template.call(this)
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'main-taskbar': MainTaskbarElement
  }
}
