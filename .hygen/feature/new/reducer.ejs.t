---
to: src/store/features/<%= feature %>/reducer.ts
---
<%
  featureTypes = h.changeCase.pascal(feature) + 'Types'
  featureActionTypes = h.changeCase.pascal(feature) + 'ActionTypes'
  featureState = h.changeCase.pascal(feature) + 'State'
-%>
import { <%= featureTypes %>, <%= featureActionTypes %> } from './types'
import { <%= featureState %> } from './models'

export { <%= featureState %> }

const initialState: <%= featureState %> = {
  entities: {},
  ids: [],
  selected: '',
  error: null,
}

export default (state: <%= featureState %> = initialState, action: <%= featureActionTypes %>): <%= featureState %> => {
  switch (action.type) {
    case <%= featureTypes %>.SELECT:
      return {
        ...state,
        selected: action.payload.id,
      }
    default:
      return state
  }
}
