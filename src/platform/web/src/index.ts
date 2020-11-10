import './sass/main.css'
import './components/main-shell/src'
// import './store'
export * from './store'

const mainShell: HTMLElement = document.createElement('main-shell')
// mainShell.setAttribute('noshadow', '')
document.body.appendChild(mainShell)
