---
to: src/store/features/<%= feature %>/actions.ts
---
<%
  featureTypes = h.changeCase.pascal(feature) + 'Types'
  featureActionTypes = h.changeCase.pascal(feature) + 'ActionTypes'
  featureActions = h.changeCase.pascal(feature) + 'Actions'
  featureState = h.changeCase.pascal(feature) + 'State'
-%>
import { createAction, ActionsUnion } from '../../actions'
import { <%= featureTypes %>, <%= featureActionTypes %> } from './types'
import { <%= featureState %> } from './models'

// ACTION CREATORS
const select = (id: string): <%= featureActionTypes %> => ({
  type: <%= featureTypes %>.SELECT,
  payload: {
    id,
  },
})

export const <%= featureActions %> = {
  select: (id: string) =>
    createAction(<%= featureTypes %>.SELECT, { id }),
}

export type <%= featureActions %> = ActionsUnion<typeof <%= featureActions %>>
