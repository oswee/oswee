import { html, TemplateResult } from 'lit-element'
import { repeat } from 'lit-html/directives/repeat'
import { HackerNewsElement } from './component'
// import '../../widgets.css'

const Link = (title, url) => html`
  <div class="news-link">
    <a href=${url}>${title}</a>
  </div>
`

// return items.map((item, index) => <Link key={index} {...item} />);
const List = items => html`
  ${repeat(
    items,
    item => item,
    (item, i) => html`${Link(item, item)}`, // Fix this
  )}
`

const HackerNews = items => {
  if (items.length === 0) {
    return html` <div class="weather-root widget">Loading News...</div> `
  }

  return html`
    <div className="news-root widget">
      <h2>Hacker News - Top 5</h2>
      ${List(items)}
    </div>
  `
}

export default function template(this: HackerNewsElement): TemplateResult {
  return html` ${HackerNews(this.items)} `
}
