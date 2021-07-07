// https://youtu.be/LZAbMCpyg0k?t=232
// https://github.com/dzintars/lit-redux-advanced-boilerplate/blob/4fc83dd8ec60c147845ec282ad1b6afb2dd1d1d6/src/store/modules/session/api.ts

const fetchWeather = async () => {
  const url = `https://api.openweathermap.org/data/2.5/weather?q=Riga&APPID=1362c34423375d167d694489b1c74080`
  const response = await fetch(url, {
    method: 'GET',
  })
  const data = await response.json()
  // console.log('API:', data)
  if (response.status >= 400) {
    throw new Error(data)
  }
  return data
}

export { fetchWeather }
