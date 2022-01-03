---
to: src/store/features/<%= feature %>/models.ts
---
<%
  featureState = h.changeCase.pascal(feature) + 'State'
-%>
export interface <%= featureState %> {
  readonly entities: { [id: string]: object }
  readonly ids: string[]
  readonly selected: string
  readonly error: Error
}
