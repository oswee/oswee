import { createSelector, createStructuredSelector } from 'reselect'
import { RootState } from 'Types'

// INPUT/BASE/ORIGIN SELECTORS
const getState = (state: RootState) => state.modules
const getApplications = (state: RootState) => state.applications.entities
const getModuleId = (state: RootState, { moduleId }): string => moduleId
const getApplicationId = (state: RootState, { applicationId }): string => applicationId

// MEMOIZED SELECTORS
const selectFetchState = createSelector([getState], state => state.fetching)
const selectSelectedModuleId = createSelector([getState], state => state.selected.id)

const selectAllModuleIds = createSelector([getState], state => state.ids)
const selectAllModules = createSelector([getState], state => state.entities)

const selectAllModulesArray = createSelector([getState, selectAllModuleIds], (state, allIds) =>
  allIds.map(id => state.entities[id]).sort(),
)

const selectModuleById = createSelector([getState, getModuleId], (modules, moduleId) => {
  // console.log('A', modules.entities[moduleId])
  return modules.entities[moduleId]
})

const selectModuleName = createSelector([selectModuleById], module => {
  // console.log('B:', module.title)
  return module.title
})

const selectModulesIdsByApplicationId = createSelector([getApplications, getApplicationId], (applications, id) => {
  // console.log('ModulesIDs ID: ', id)
  // console.log('ModulesIDs Apps: ', applications)
  // console.log('ModulesIDs: ', applications[id].modules)
  return applications[id].modules || []
})

const selectModulesByApplicationId = createSelector(
  [selectAllModules, selectModulesIdsByApplicationId],
  (modules, ids) => {
    // console.log(
    //   'Modules: ',
    //   ids.map(id => modules[id])
    // )
    return ids.map(id => modules[id]) || []
  },
)

const selectModuleSummary = createStructuredSelector({
  id: getModuleId,
  title: selectModuleName,
})

export const Selectors = {
  selectFetchState,
  selectSelectedModuleId,
  selectAllModuleIds,
  selectAllModules,
  selectAllModulesArray,
  selectModuleById,
  selectModuleName,
  selectModulesIdsByApplicationId,
  selectModulesByApplicationId,
  selectModuleSummary,
}
