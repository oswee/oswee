import './sass/main.css'
import './components/app-shell/src'
// import './store'
export * from './store'

const appShell: HTMLElement = document.createElement('app-shell')
document.body.appendChild(appShell)
