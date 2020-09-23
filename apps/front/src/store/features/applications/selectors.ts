import { createSelector } from 'reselect'
import { RootState } from '../../reducer'

// INPUT/BASE SELECTORS
const getState = (state: RootState) => state.applications
// const getApplicationId = (state: RootState, { applicationId }) => applicationId

// MEMOIZED SELECTORS
const selectFetchState = createSelector([getState], state => state.fetching)
const selectSelectedApplicationId = createSelector([getState], state => state.selected.id)

const selectAllApplicationIds = createSelector([getState], state => state.ids)
const selectAllApplications = createSelector([getState], state => state.entities)

const selectAllApplicationsArray = createSelector([getState, selectAllApplicationIds], (state, allIds) => {
  // To return applications in specific order, i should map over allIds
  return allIds.map(id => state.entities[id]).sort() // Returns an array!!!
})

const selectApplicationById = createSelector([selectAllApplications, selectSelectedApplicationId], (entities, id) => {
  // console.log('Applications: ', applications[getApplicationId])
  return entities[id]
})

const selectApplicationName = createSelector([selectApplicationById], application => application.title)

const selectApplicationModules = createSelector([selectApplicationById], application => {
  // console.log('Modules: ', application.modules)
  return application.modules || []
})

const selectSelectedApplication = createSelector([getState], state => state.selected)

const selectDefaultApplicationModule = createSelector([selectApplicationById], application => application.defaultModule)

export const ApplicationSelectors = {
  selectFetchState,
  selectSelectedApplicationId,
  selectAllApplicationIds,
  selectAllApplications,
  selectAllApplicationsArray,
  selectApplicationById,
  selectApplicationName,
  selectApplicationModules,
  selectSelectedApplication,
  selectDefaultApplicationModule,
}
