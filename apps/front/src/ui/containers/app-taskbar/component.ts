import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import {
  store,
  RootState,
  UiSelectors,
  toggleAccountWidget,
  toggleActionCenter,
  LauncherActions,
  switchTheme,
} from '../../../store'
import { connect } from '../../../utils/connect'
import { Theme } from '../../../assets/style'
import template from './template'
import style from './style'

@customElement('app-taskbar')
export class AppTaskbarElement extends connect(store, LitElement) {
  @property({ type: Boolean }) isActionWidgetDisplayed: boolean = false
  @property({ type: Boolean }) isActionCenterDisplayed: boolean = false

  mapState(state: RootState) {
    return {
      isActionWidgetDisplayed: UiSelectors.getAccountWidgetVisibility(state),
      isActionCenterDisplayed: UiSelectors.getActionCenterVisibility(state),
    }
  }

  displayLauncher(): void {
    store.dispatch(LauncherActions.displayLauncher())
  }

  toggleAccountWidget(): void {
    store.dispatch(toggleAccountWidget())
  }

  toggleActionCenter(): void {
    store.dispatch(toggleActionCenter())
  }

  switchTheme(): void {
    store.dispatch(switchTheme())
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [Theme, style]
  }

  createRenderRoot(): Element | ShadowRoot {
    return this.hasAttribute('noshadow') ? this : super.createRenderRoot()
  }
}
