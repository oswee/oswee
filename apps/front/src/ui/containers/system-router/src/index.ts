import UniversalRouter from 'universal-router'
import { LitElement, TemplateResult, CSSResult, customElement, html, property, css, PropertyValues } from 'lit-element'
import { unsafeHTML } from 'lit-html/directives/unsafe-html'
// import { connect } from '@captaincodeman/redux-connect-element'
import { connect } from '@oswee/libs/connect'
import { store, RootState, RoutingSelectors } from '../../../../store/src'
import '../../views/view-home'
import '../../containers/view-home-connected'
import '../../views/view-dispatch'
import '../../containers/view-dispatch-connected'
import '../../views/view-dispatch-consignments'
import '../../views/view-sales'
import '../../containers/view-sales-connected'
import '../../views/view-signin'
import '../../views/view-signup'
import '../../views/view-error'
import '../../views/view-not-found'

@customElement('system-router')
export class SystemRouterElement extends connect(store, LitElement) {
  @property({ type: String }) pathname: string
  @property({ type: String }) view: string

  mapState(state: RootState) {
    return {
      pathname: RoutingSelectors.pathname(state),
    }
  }

  constructor() {
    super()
    this.router = new UniversalRouter(this.routes)
  }

  private router: UniversalRouter

  private routes = [
    {
      path: '/',
      children: [
        {
          path: '',
          action: (): string => `<view-home noshadow>Test</view-home>`,
        },
        {
          path: '/dispatch',
          children: [
            {
              path: '',
              action: (): string => `<view-dispatch noshadow></view-dispatch>`,
              // action: () => import(/* webpackChunkName: "view-dispatch" */ '../../views/view-dispatch'),
              // load: () => ViewDispatchElement,
            },
            {
              path: '/zones',
              children: [
                {
                  path: '',
                  action: (): string => `<view-dispatch noshadow></view-dispatch>`,
                },
                {
                  path: '/:id',
                  action: (): string => `<view-dispatch noshadow></view-dispatch>`,
                },
              ],
            },
            {
              path: '/consignments',
              children: [
                {
                  path: '',
                  action: (): string => `<view-dispatch-consignments noshadow></view-dispatch-consignments>`,
                },
                {
                  path: '/:id',
                  action: (): string => `<view-dispatch-consignments noshadow></view-dispatch-consignments>`,
                },
              ],
            },
          ],
        },
        {
          path: '/sales',
          children: [
            {
              path: '',
              action: (): string => `<view-sales noshadow></view-sales>`,
            },
          ],
        },
      ],
    },
    {
      path: '/signin',
      action: (): string => `<view-signin noshadow></view-signin>`,
    },
    {
      path: '/signup',
      action: (): string => `<view-signup noshadow></view-signup>`,
    },
    {
      path: '/forgot-password',
      action: (): string => `<app-forgot-password></app-forgot-password>`,
    },
    { path: '(.*)', action: (): string => `<view-not-found noshadow></view-not-found>` },
  ]

  createRenderRoot(): this {
    return this
  }

  shouldUpdate(changedProperties: PropertyValues) {
    if (changedProperties.has('pathname')) {
      this.router
        .resolve(this.pathname)
        .then(html => (this.view = html))
        .catch(error => (this.view = `<view-error>${error}</view-error>`))
    }
    return changedProperties.has('view')
  }

  render(): TemplateResult {
    return html` ${unsafeHTML(this.view)} `
  }

  static get styles(): CSSResult {
    return css`
      :host {
        display: block;
      }
    `
  }
}
