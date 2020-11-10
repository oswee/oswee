import { svg, SVGTemplateResult } from 'lit-element'

// export const Grid = (color: string): SVGTemplateResult => {
//   const params = {
//     primaryColor: color,
//   }
//   return svg`
//     <svg viewBox="0 0 128 128">
//         <path class='primary' stroke=${params.primaryColor} stroke-linecap="round" d="M32 24h64"/>
//         <path class='secondary' stroke=${params.primaryColor} stroke-linecap="round" d="M48 104h64M16 64h64M32 0"/>
//     </svg>
// `
// }

// export const Question = (): SVGTemplateResult => svg`
//     <svg id="i-question" viewBox="0 0 24 24">
//         <path d="M10.8 19.2H13.2V16.8H10.8V19.2ZM12 0C5.376 0 0 5.376 0 12C0 18.624 5.376 24 12 24C18.624 24 24 18.624 24 12C24 5.376 18.624 0 12 0ZM12 21.6C6.708 21.6 2.4 17.292 2.4 12C2.4 6.708 6.708 2.4 12 2.4C17.292 2.4 21.6 6.708 21.6 12C21.6 17.292 17.292 21.6 12 21.6ZM12 4.8C9.348 4.8 7.2 6.948 7.2 9.6H9.6C9.6 8.28 10.68 7.2 12 7.2C13.32 7.2 14.4 8.28 14.4 9.6C14.4 12 10.8 11.7 10.8 15.6H13.2C13.2 12.9 16.8 12.6 16.8 9.6C16.8 6.948 14.652 4.8 12 4.8Z"/>
//     </svg>
// `

// export const ChevronRight = (): SVGTemplateResult => svg`
//     <svg id="i-chevron-right" viewBox="0 0 32 32" width="12" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
//         <path d="M12 30 L24 16 12 2" />
//     </svg>
// `

// export const Message = (): SVGTemplateResult => svg`
//     <svg id="i-msg" viewBox="0 0 32 32" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
//         <path d="M2 4 L30 4 30 22 16 22 8 29 8 22 2 22 Z" />
//     </svg>
// `

// export const User = (): SVGTemplateResult => svg`
//   <svg viewBox="0 0 512 512">
//     <path class="main" stroke="black" d="M256 1C115.24 1 1 115.24 1 256C1 396.76 115.24 511 256 511C396.76 511 511 396.76 511 256C511 115.24 396.76 1 256 1ZM256 77.5C298.33 77.5 332.5 111.67 332.5 154C332.5 196.33 298.33 230.5 256 230.5C213.67 230.5 179.5 196.33 179.5 154C179.5 111.67 213.67 77.5 256 77.5ZM256 439.6C192.25 439.6 135.895 406.96 103 357.49C103.765 306.745 205 278.95 256 278.95C306.745 278.95 408.235 306.745 409 357.49C376.105 406.96 319.75 439.6 256 439.6Z"/>
//   </svg>
// `

export const Icon = (icon: string, title?: string, cls?: string): SVGTemplateResult => {
  switch (icon !== '') {
    case icon === 'gear':
      return svg`
        <svg class=${cls} viewBox="0 0 64 64" xmlns="https://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
          <title>${title}</title>
          <path d="M31.9999 39.7715C36.292 39.7715 39.7714 36.2921 39.7714 32.0001C39.7714 27.708 36.292 24.2286 31.9999 24.2286C27.7079 24.2286 24.2285 27.708 24.2285 32.0001C24.2285 36.2921 27.7079 39.7715 31.9999 39.7715Z"/>
          <path d="M44.2057 12.3503L37.2243 9.5L33.4962 15.367H30.4921L26.7875 9.5L19.7705 11.8991L21.3138 19.1912L19.1884 21.3171L12.4205 19.8088L9.52341 26.8043L15.3655 30.5217V33.4195L9.5 37.2318L12.4209 44.2034L19.1888 42.707L21.3134 44.8325L19.8063 51.5907L26.7879 54.4884L30.5037 48.6448H33.567L37.2358 54.5L44.2057 51.5904L42.6865 44.8091L44.8118 42.6951L51.6622 44.215L54.4881 37.2197L48.6344 33.5025V30.498L54.5 26.7803L51.5798 19.8091L44.8118 21.3174L42.6859 19.1674L44.2057 12.3503Z"/>
        </svg>
      `
    case icon === 'arrow-left':
      return svg`
        <svg class=${cls} viewBox="0 0 64 64" xmlns="https://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
          <title>${title}</title>
          <path d="M30.0305 9.95959L8 31.9621M8 31.9621L30.0286 53.9596M8 31.9621H56"/>
        </svg>
      `
    case icon === 'kanban':
      return svg`
      <svg class=${cls} viewBox="0 0 64 64" xmlns="https://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
        <title>${title}</title>
        <rect x="36" y="8" width="20" height="28"/>
        <rect x="8" y="8" width="20" height="48"/>
      </svg>
      `
    case icon === 'placemark':
      return svg`
        <svg class=${cls} viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
        <title>${title}</title>
          <path d="M18.9 10.013v.002c.037 2.043-1.04 3.7-1.37 4.115a2810.98 2810.98 0 01-3.63 4.54c-.753.939-1.368 1.706-1.686 2.106-.103.096-.17.124-.221.124-.052 0-.12-.029-.222-.125l-.226-.282c-.946-1.178-3.64-4.53-5.099-6.362h0l-.005-.007c-.116-.122-.468-.61-.783-1.342-.314-.73-.588-1.694-.557-2.766h0v-.003C5.1 6.195 8.19 3.1 12 3.1c3.81 0 6.9 3.095 6.9 6.913z"/>
        </svg>
      `
    case icon === 'info':
      return svg`
        <svg class=${cls} viewBox="0 0 64 64" xmlns="https://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
          <title>${title}</title>
          <path d="M31 28.5714V43.9999H33V28.5714H31ZM33 43.9999V28.5714H31V43.9999H33ZM31 18.2856V21.7142H33V18.2856H31Z"/>
          <path d="M55.5 32C55.5 44.9787 44.9787 55.5 32 55.5C19.0213 55.5 8.5 44.9787 8.5 32C8.5 19.0213 19.0213 8.5 32 8.5C44.9787 8.5 55.5 19.0213 55.5 32Z"/>
        </svg>
      `
    case icon === 'user':
      return svg`
        <svg class=${cls} viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
          <title>${title}</title>
          <circle cx="32" cy="22" r="14"/>>
          <path d="M52 56c0-11.046-8.954-20-20-20s-20 8.954-20 20"/>
        </svg>
      `
    case icon === 'apps':
      return svg`
      <svg class=${cls} viewBox="0 0 64 64" aria-hidden="true" focusable="false">
      <title>${title}</title>
        <circle cx="51" cy="51" r="6"/>
        <circle cx="32" cy="51" r="6"/>
        <circle cx="13" cy="51" r="6"/>
        <circle cx="51" cy="32" r="6"/>
        <circle cx="32" cy="32" r="6"/>
        <circle cx="13" cy="32" r="6"/>
        <circle cx="51" cy="13" r="6"/>
        <circle cx="32" cy="13" r="6"/>
        <circle cx="13" cy="13" r="6"/>
      </svg>
    `
    case icon === 'palette':
      return svg`
        <svg class=${cls} viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" role="presentation">
          <title>${title}</title>
          <path d="M7.90396 0.5C12.0904 0.5 15.5 3.95998 15.5 8.24772C15.5 12.584 12.4563 15.9318 8.53943 15.4537C8.37205 15.4066 8.28666 15.3401 8.23533 15.278C8.17686 15.2072 8.12687 15.0985 8.09821 14.9205C8.04439 14.5862 8.08258 14.1645 8.1323 13.6157C8.14035 13.5268 8.1487 13.4346 8.15701 13.3389C8.26849 12.0552 8.34667 10.3086 6.75471 9.06354C6.00798 8.47952 5.34162 8.24786 4.71116 8.27216C4.0988 8.29576 3.59897 8.56135 3.20512 8.78663C3.15427 8.81571 3.1055 8.84385 3.05851 8.87096C2.7088 9.07272 2.45825 9.21727 2.18829 9.26946C1.94647 9.31621 1.65074 9.29119 1.22369 8.97466C0.592689 8.28617 0.403177 7.46388 0.543731 6.57777C0.689119 5.66118 1.19118 4.67574 1.94522 3.7578C3.46612 1.90631 5.86428 0.5 7.90396 0.5Z"/>
          <circle cx="10.947" cy="12.0561" r="0.7"/>
          <circle cx="12.9154" cy="8.45609" r="0.7"/>
          <circle cx="11.2407" cy="4.8561" r="0.7"/>
          <circle cx="6.79998" cy="3.6561" r="0.7"/>
          <circle cx="3.50768" cy="6.05609" r="0.7"/>
        </svg>
    `
    case icon === 'message':
      return svg`
        <svg class=${cls} id="i-msg" viewBox="0 0 32 32" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" focusable="false">
        <title>${title}</title>
          <path d="M2 4 L30 4 30 22 16 22 8 29 8 22 2 22 Z" />
        </svg>
    `
    case icon === 'question':
      return svg`
        <svg class=${cls} id="i-question" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
        <title>${title}</title>
          <path d="M10.8 19.2H13.2V16.8H10.8V19.2ZM12 0C5.376 0 0 5.376 0 12C0 18.624 5.376 24 12 24C18.624 24 24 18.624 24 12C24 5.376 18.624 0 12 0ZM12 21.6C6.708 21.6 2.4 17.292 2.4 12C2.4 6.708 6.708 2.4 12 2.4C17.292 2.4 21.6 6.708 21.6 12C21.6 17.292 17.292 21.6 12 21.6ZM12 4.8C9.348 4.8 7.2 6.948 7.2 9.6H9.6C9.6 8.28 10.68 7.2 12 7.2C13.32 7.2 14.4 8.28 14.4 9.6C14.4 12 10.8 11.7 10.8 15.6H13.2C13.2 12.9 16.8 12.6 16.8 9.6C16.8 6.948 14.652 4.8 12 4.8Z"/>
        </svg>
      `
    case icon === 'chevron-right':
      return svg`
        <svg class=${cls} id="i-chevron-right" viewBox="0 0 32 32" width="12" stroke="currentcolor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" focusable="false">
          <title>${title}</title>
          <path d="M12 30 L24 16 12 2" />
        </svg>
      `
    default:
      return svg``
  }
}
