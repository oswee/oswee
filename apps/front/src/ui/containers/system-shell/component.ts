import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import { connect } from '../../../utils/connect'
import {
  store,
  RootState,
  WebsocketSelectors,
  LauncherSelectors,
  LauncherActions,
  SystemActions,
  ThemeSelectors,
  websocketConnect,
} from '../../../store'
import { Theme } from '../../../assets/style'
import template from './template'
import style from './style'
// import { EventPathIncludes } from '../../../utils'

@customElement('system-shell')
export class SystemShellElement extends connect(store, LitElement) {
  @property({ type: Boolean }) websocketState: boolean = false
  @property({ type: Boolean }) isLauncherVisible: boolean = false
  @property({ type: Object }) theme: object = {}

  mapState(state: RootState) {
    return {
      websocketState: WebsocketSelectors.selectConnectedState(state),
      isLauncherVisible: LauncherSelectors.getLauncherVisibility(state),
      theme: ThemeSelectors.getTheme(state),
    }
  }

  mapEvents() {
    return {
      'nav-item-click': () => LauncherActions.hideLauncher(),
    }
  }

  // Intercept custom events from child components and call Redux action (works only if store is connected)
  // mapEvents() {
  //   return {
  //     // 'launcher-click': (e: CustomEvent) => UserActions.selectUser(e.detail.key),
  //     'launcher-click': (e: CustomEvent) => {
  //       console.log(e)
  //     },
  //   }
  // }

  updated(): void {
    // Update the theme custom properties
    const root = document.documentElement
    Object.entries(this.theme).map(item => {
      // console.log(typeof item[0]) // TIL: The way to check type
      root.style.setProperty(String(item[0]), item[1])
    })
  }

  connectedCallback(): void {
    super.connectedCallback()
    store.dispatch(websocketConnect('wss://api.oswee.com'))
    store.dispatch(SystemActions.loaded())
    // const root = document.documentElement
    // Object.entries(this.theme).map(item => {
    //   root.style.setProperty(String(item[0]), item[1])
    // })
    // https://stackoverflow.com/a/37559790/6651080
    document.addEventListener('keydown', function (e) {
      if (e.ctrlKey && e.shiftKey && e.keyCode === 80) {
        e.stopPropagation()
        e.preventDefault()
        // console.log(e)
      }
    })
    document.addEventListener('launcher-click', function (e) {
      console.log('launcher-click received', e)
    })
    document.addEventListener('application-shortcut-click', function (e) {
      console.log('start-application-click received', e)
    })
    // this.addEventListener('click', function(e: any) {
    //   if (EventPathIncludes(e, '#main-launcher')) {
    //     console.log('Regular click received', e)
    //   }
    //   console.log('Click received', e)
    // })
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
