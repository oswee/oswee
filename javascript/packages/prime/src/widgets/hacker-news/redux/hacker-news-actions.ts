export const HackerNewsStoriesAvailable = 'hackernews/storiesavailable'
export const HackerNewsLoadStories = 'hackernews/loadstories'

// action creator : StoriesAvailable
export const storiesAvailable = items => {
  return {
    type: HackerNewsStoriesAvailable,
    payload: {
      items,
    },
  }
}

// thunk to fetch the stories
export const fetchStories = () => {
  console.log('Thunk')
  return (dispatch, getState): any => {
    fetchJson('https://hacker-news.firebaseio.com/v0/topstories.json').then(
      ids => {
        console.log(ids)
        const top5 = ids.splice(0, 5)
        const promises = []
        for (const id of top5) {
          promises.push(
            fetchJson(
              'https://hacker-news.firebaseio.com/v0/item/' + id + '.json',
            ),
          )
        }
        Promise.all(promises).then(stories => {
          console.log('Thunk:', stories)
          dispatch(storiesAvailable(stories))
        })
      },
    )
  }
}

// Helper to fetch the json
const fetchJson = url => {
  return fetch(url).then(response => {
    return response.json()
  })
}
