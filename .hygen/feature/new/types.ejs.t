---
to: src/store/features/<%= feature %>/types.ts
---
<%
  featureTypes = h.changeCase.pascal(feature) + 'Types'
  featureUpcase = h.changeCase.constantCase(feature)
  featureActionTypes = h.changeCase.pascal(feature) + 'ActionTypes'
  featureState = h.changeCase.pascal(feature) + 'State'
-%>
import { <%= featureState %> } from './models'

export enum <%= featureTypes %> {
  SELECT = '<%= featureUpcase %>__SELECT',
}

interface Select {
  readonly type: <%= featureTypes %>.SELECT
  readonly payload: {
    id: string
  }
}

export type <%= featureActionTypes %> =
  | Select
