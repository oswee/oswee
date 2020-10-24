import './sass/main.css'
import './components/app-shell/src'
// import './store'
export * from './store'

const appShell: HTMLElement = document.createElement('app-shell')
appShell.setAttribute('noshadow', '')
document.body.appendChild(appShell)
