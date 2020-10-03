import { html, TemplateResult } from 'lit-element'
import { LeafletMapElement } from './component'

export default function template(this: LeafletMapElement): TemplateResult {
  return html`
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
      integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
      crossorigin=""
    />
    <div id="map"></div>
  `
}
