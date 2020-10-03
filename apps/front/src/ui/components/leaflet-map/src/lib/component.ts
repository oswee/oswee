import { LitElement, property, customElement, TemplateResult, CSSResultArray } from 'lit-element'
import L from 'leaflet'
import template from './template'
import style from './style'

@customElement('leaflet-map')
export class LeafletMapElement extends LitElement {
  @property({ type: String }) key: string = '9a30119-d673-4978-b393-f608fe28ae07'
  private _connected = false

  constructor() {
    super()
    // const map = new L.Map(this.renderRoot.querySelector<HTMLElement>('#map'), {
    //   center: [56.94965, 24.1052],
    //   zoom: 13,
    // })
  }

  public connectedCallback(): void {
    super.connectedCallback()
    this._connected = true
    // const root = new HTMLDivElement()
    // this.renderRoot.appendChild(root).setAttribute('id', 'map')
    // // console.log(this.renderRoot.querySelector<HTMLElement>('#map'))
    // const map = new L.Map(root, {
    //   center: [56.94965, 24.1052],
    //   zoom: 13,
    // })
  }

  public disconnectedCallback(): void {
    super.disconnectedCallback()
    this._connected = false
  }

  protected firstUpdated(): void {
    // this.loadMap()

    const map = new L.Map(this.renderRoot.querySelector<HTMLElement>('#map'), {
      center: [56.94965, 24.1052],
      zoom: 13,
    })
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: `Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>`,
      maxZoom: 24,
      id: 'leaflet.normal',
    }).addTo(map)
  }

  protected render(): TemplateResult {
    return template.call(this)
  }

  public static get styles(): CSSResultArray {
    return [style]
  }
}
