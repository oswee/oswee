import { LitElement, customElement, property, TemplateResult, CSSResultArray } from 'lit-element'
import { getHackerNewsModule } from '../redux/hacker-news-module'
import { connect } from '@oswee/libs/connect'
import { store } from '../../../store'
import template from './template'
import style from './style'

@customElement('hacker-news')
export class HackerNewsElement extends connect(store, LitElement) {
  @property({ type: Object }) items: {}

  constructor() {
    super()
    store.addModules([getHackerNewsModule()])
  }

  mapState(state) {
    return {
      items: state.hackerNews ? state.hackerNews.items : [],
    }
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}