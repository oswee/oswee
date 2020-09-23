import { LitElement, customElement, html, property, css } from 'lit-element'
import { connect } from '../../../utils/connect'
import { store, RootState, User, UserSelectors } from '../../../store'
import '../../components/my-component'

@customElement('view-user-detail')
export class UserDetailElement extends connect(store, LitElement) {
  @property({ type: Object }) user: User

  mapState(state: RootState) {
    return {
      user: UserSelectors.user(state),
    }
  }

  clicked(e: Event) {
    this.user
    console.log('this')
  }

  render() {
    const u = this.user

    return html` <my-component .key=${u.id} .name=${u.name}></my-component> `
  }

  static get styles() {
    return css`
      :host {
        display: block;
      }
      my-component {
        margin: 1rem;
      }
    `
  }
}
