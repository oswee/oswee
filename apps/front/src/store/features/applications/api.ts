const URL = `${window.MyApp.localApi}/applications`

function* fetchApplications() {
  const response = yield fetch(URL, {
    method: 'GET',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    },
  })
  const applications = yield response.status === 200 ? response.json() : []
  return applications
}

// const fetchApplications = async page => {
//   const response = await fetch(`${URL}`)
//   const data = await response.json()
//   if (response.status >= 400) {
//     throw new Error(data)
//   }
//   console.log(data)
//   return data.applications.reduce((apps: Application[], app: Application) => {
//     apps[app.uuid] = app
//     console.log(apps)
//     return apps
//   }, {})
// }

export const API = {
  fetchApplications,
}
