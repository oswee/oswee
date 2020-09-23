import { LitElement, customElement, html, property, css, TemplateResult, CSSResult } from 'lit-element'
import { repeat } from 'lit-html/directives/repeat'
import { connect } from '../../../utils/connect'
import { store, RootState, User, UserSelectors, UserActions } from '../../../store'
import '../../components/my-component'

@customElement('view-user-list')
export class UserListElement extends connect(store, LitElement) {
  @property({ type: Array }) users: User[]
  @property({ type: Number }) selected: number

  mapState(state: RootState) {
    return {
      users: UserSelectors.users(state),
      selected: UserSelectors.selected(state),
    }
  }

  // Intercept custom events from child components and call Redux action (Connect lib)
  mapEvents() {
    return {
      'my-component-click': (e: CustomEvent) => UserActions.selectUser(e.detail.key),
    }
  }

  render(): TemplateResult {
    return html`
      ${repeat(
        this.users,
        user => user.id,
        user => html`
          <my-component .key=${user.id} .name=${user.name} .selected=${user.id === this.selected}></my-component>
        `,
      )}
    `
  }

  static get styles(): CSSResult {
    return css`
      :host {
        flex: 1;
        display: fex;
        flex-direction: column;
        overflow: auto;
        /* border: 5px solid red; */
        background-color: var(--color-white);
      }

      my-component {
        margin: 1rem;
        box-sizing: border-box;
      }
    `
  }
}
