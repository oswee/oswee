import { LitElement, TemplateResult, CSSResultArray } from 'lit'
import { customElement, property } from 'lit/decorators.js'
import { getHackerNewsModule } from '../redux/hacker-news-module'
import { connect } from '@oswee/lib/connect'
import { store } from '@oswee/packages/store'
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
