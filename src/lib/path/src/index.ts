// https://github.com/codebryo/event-path-includes/blob/master/dist/index.js

function parseSelector(selector) {
  const logic = {
    isClass: selector.startsWith('.'),
    isId: selector.startsWith('#'),
  }

  const key = logic.isClass ? 'className' : logic.isId ? 'id' : ''

  return {
    key,
    val: selector.substr(1),
  }
}

function EventPathIncludes(event, selector): boolean {
  // https://stackoverflow.com/questions/39245488/event-path-undefined-with-firefox-and-vue-js
  if (!event || !(event.path || (event.composedPath && event.composedPath()))) return false

  const selectorDetails = parseSelector(selector)
  return (event.path || (event.composedPath && event.composedPath())).some(el => {
    if (!el[selectorDetails.key]) return false
    return el[selectorDetails.key].includes(selectorDetails.val)
  })
}

export { EventPathIncludes }
