---
to: src/store/features/<%= feature %>/index.ts
---
<%
  featureSelectors = h.changeCase.pascal(feature) + 'Selectors'
-%>
import * as <%= featureSelectors %> from './selectors'

export * from './actions'
export * from './models'
export * from './selectors'
