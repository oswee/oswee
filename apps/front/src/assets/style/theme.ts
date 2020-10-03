import { css } from 'lit-element'

export const Theme = css`
  /* :root { */
  :host {
    /* Global hue */
    --theme-color-base-hue: 270;
    --theme-color-accent-hue: 215;
    --theme-color-success-hue: 100;
    --theme-color-warning-hue: 44;
    --theme-color-alert-hue: 3;
    --theme-color-neutral-hue: 30;
    /* B&W */
    --theme-color-white: hsla(0, 100%, 100%, 1);
    --theme-color-black: hsla(0, 0%, 0%, 1);
    /* Theme Base - Used for base layout, backgrounds, inputs */
    --theme-color-base: var(--root-color-base, hsla(215, 14%, 19%, 1));
    --theme-color-accent: var(--root-color-accent, hsla(215, 100%, 50%, 1));

    /* --theme-color-base-10: hsla(var(--theme-color-base-hue, 0), 100%, 95%, 1);
    --theme-color-base-20: hsla(var(--theme-color-base-hue, 0), 100%, 91%, 1);
    --theme-color-base-30: hsla(var(--theme-color-base-hue, 0), 100%, 86%, 1);
    --theme-color-base-40: hsla(var(--theme-color-base-hue, 0), 100%, 82%, 1);
    --theme-color-base-50: hsla(var(--theme-color-base-hue, 0), 100%, 77%, 1);
    --theme-color-base-60: hsla(var(--theme-color-base-hue, 0), 100%, 73%, 1);
    --theme-color-base-70: hsla(var(--theme-color-base-hue, 0), 100%, 68%, 1);
    --theme-color-base-80: hsla(var(--theme-color-base-hue, 0), 100%, 64%, 1);
    --theme-color-base-90: hsla(var(--theme-color-base-hue, 0), 100%, 59%, 1);
    --theme-color-base-100: hsla(var(--theme-color-base-hue, 0), 100%, 55%, 1);
    --theme-color-base-110: hsla(var(--theme-color-base-hue, 0), 100%, 50%, 1);
    --theme-color-base-120: hsla(var(--theme-color-base-hue, 0), 100%, 45%, 1);
    --theme-color-base-130: hsla(var(--theme-color-base-hue, 0), 100%, 41%, 1);
    --theme-color-base-140: hsla(var(--theme-color-base-hue, 0), 100%, 36%, 1);
    --theme-color-base-150: hsla(var(--theme-color-base-hue, 0), 100%, 32%, 1);
    --theme-color-base-160: hsla(var(--theme-color-base-hue, 0), 100%, 27%, 1);
    --theme-color-base-170: hsla(var(--theme-color-base-hue, 0), 100%, 23%, 1);
    --theme-color-base-180: hsla(var(--theme-color-base-hue, 0), 100%, 18%, 1);
    --theme-color-base-190: hsla(var(--theme-color-base-hue, 0), 100%, 14%, 1);
    --theme-color-base-200: hsla(var(--theme-color-base-hue, 0), 100%, 9%, 1);
    --theme-color-base-210: hsla(var(--theme-color-base-hue, 0), 100%, 5%, 1); */
    /* Theme Accent - Used for default buttons, UI borders, icons */
    --theme-color-accent-10: hsla(var(--theme-color-accent-hue, 215), 100%, 95%, 1);
    --theme-color-accent-20: hsla(var(--theme-color-accent-hue, 215), 100%, 91%, 1);
    --theme-color-accent-30: hsla(var(--theme-color-accent-hue, 215), 100%, 86%, 1);
    --theme-color-accent-40: hsla(var(--theme-color-accent-hue, 215), 100%, 82%, 1);
    --theme-color-accent-50: hsla(var(--theme-color-accent-hue, 215), 100%, 77%, 1);
    --theme-color-accent-60: hsla(var(--theme-color-accent-hue, 215), 100%, 73%, 1);
    --theme-color-accent-70: hsla(var(--theme-color-accent-hue, 215), 100%, 68%, 1);
    --theme-color-accent-80: hsla(var(--theme-color-accent-hue, 215), 100%, 64%, 1);
    --theme-color-accent-90: hsla(var(--theme-color-accent-hue, 215), 100%, 59%, 1);
    --theme-color-accent-100: hsla(var(--theme-color-accent-hue, 215), 100%, 55%, 1);
    --theme-color-accent-110: hsla(var(--theme-color-accent-hue, 215), 100%, 50%, 1);
    --theme-color-accent-120: hsla(var(--theme-color-accent-hue, 215), 100%, 45%, 1);
    --theme-color-accent-130: hsla(var(--theme-color-accent-hue, 215), 100%, 41%, 1);
    --theme-color-accent-140: hsla(var(--theme-color-accent-hue, 215), 100%, 36%, 1);
    --theme-color-accent-150: hsla(var(--theme-color-accent-hue, 215), 100%, 32%, 1);
    --theme-color-accent-160: hsla(var(--theme-color-accent-hue, 215), 100%, 27%, 1);
    --theme-color-accent-170: hsla(var(--theme-color-accent-hue, 215), 100%, 23%, 1);
    --theme-color-accent-180: hsla(var(--theme-color-accent-hue, 215), 100%, 18%, 1);
    --theme-color-accent-190: hsla(var(--theme-color-accent-hue, 215), 100%, 14%, 1);
    --theme-color-accent-200: hsla(var(--theme-color-accent-hue, 215), 100%, 9%, 1);
    --theme-color-accent-210: hsla(var(--theme-color-accent-hue, 215), 100%, 5%, 1);
    /* Theme Success */
    --theme-color-success-10: hsla(var(--theme-color-success-hue, 100), 100%, 38%, 1);
    /* Theme Warning */
    --theme-color-warning-10: hsla(var(--theme-color-warning-hue, 44), 98%, 50%, 1);
    /* Theme Alert */
    --theme-color-alert-10: hsla(var(--theme-color-alert-hue, 3), 98%, 46%, 1);
    /* Theme Neutral */
    --theme-color-neutral-10: hsla(var(--theme-color-neutral-hue, 30), 2%, 53%, 1);
    /* Icons */
    --theme-icon-size-s: 1.25em;
    --theme-icon-size-m: 1.5em;
    --theme-icon-size-l: 2.25em;
    /* Size */
    --theme-size-xs: 1.625rem; /* 26px */
    --theme-size-s: 1.875rem; /* 30px */
    --theme-size-m: 2.25rem; /* 36px */
    --theme-size-l: 2.75rem; /* 44px */
    --theme-size-xl: 3.5rem; /* 56px */

    /* Spacing */
    --theme-space-xs: 0.25rem;
    --theme-space-s: 0.5rem;
    --theme-space-m: 1rem;
    --theme-space-l: 1.5rem;
    --theme-space-xl: 2.5rem;
    /* Spacing wide - mostly used as paddings or margins */
    --theme-space-wide-xs: calc(var(--theme-space-xs, 0.25rem) / 2) var(--theme-space-xs, 0.25rem);
    --theme-space-wide-s: calc(var(--theme-space-s, 0.5rem) / 2) var(--theme-space-s, 0.5rem);
    --theme-space-wide-m: calc(var(--theme-space-m, 1rem) / 2) var(--theme-space-m, 1rem);
    --theme-space-wide-l: calc(var(--theme-space-l, 1.5rem) / 2) var(--theme-space-l, 1.5rem);
    --theme-space-wide-xl: calc(var(--theme-space-xl, 2.5rem) / 2) var(--theme-space-xl, 2.5rem);
    /* Spacing tall - mostly used as paddings or margins */
    --theme-space-tall-xs: var(--theme-space-xs, 0.25rem) calc(var(--theme-space-xs, 0.25rem) / 2);
    --theme-space-tall-s: var(--theme-space-s, 0.5rem) calc(var(--theme-space-s, 0.5rem) / 2);
    --theme-space-tall-m: var(--theme-space-m, 1rem) calc(var(--theme-space-m, 1rem) / 2);
    --theme-space-tall-l: var(--theme-space-l, 1.5rem) calc(var(--theme-space-l, 1.5rem) / 2);
    --theme-space-tall-xl: var(--theme-space-xl, 2.5rem) calc(var(--theme-space-xl, 2.5rem) / 2);
    /* Typography */
    --theme-font-family: Montserrat, sans-serif;
    --theme-font-size-xxxl: 2.5rem;
    --theme-font-size-xxl: 1.75rem;
    --theme-font-size-xl: 1.375rem;
    --theme-font-size-l: 1.125rem;
    --theme-font-size-m: 1rem;
    --theme-font-size-s: 0.875rem;
    --theme-font-size-xs: 0.8125rem;
    --theme-font-size-xxs: 0.75rem;
    --theme-line-height-m: 1.625;
    --theme-line-height-s: 1.375;
    --theme-line-height-xs: 1.25;
    /* Border radius */
    --theme-border-radius-s: 0.25em;
    --theme-border-radius-m: 0.25em;
    --theme-border-radius-l: 0.5em;
    /* Shadows */
    --theme-shadow-4: 0 1.6px 3.6px 0 rgba(0, 0, 0, 0.132), 0 0.3px 0.9px 0 rgba(0, 0, 0, 0.108); /* Cards, Grid item thumbnails */
    --theme-shadow-8: 0 3.2px 7.2px 0 rgba(0, 0, 0, 0.132), 0 0.6px 1.8px 0 rgba(0, 0, 0, 0.108); /* Command bars, Command dropdowns, Context menus */
    --theme-shadow-16: 0 6.4px 14.4px 0 rgba(0, 0, 0, 0.132), 0 1.2px 3.6px 0 rgba(0, 0, 0, 0.108); /* Teaching callouts, Search results dropdown, Hover cards, Tooltips */
    --theme-shadow-64: 0 25.6px 57.6px 0 rgba(0, 0, 0, 0.22), 0 4.8px 14.4px 0 rgba(0, 0, 0, 0.18); /* Panels, Pop up dialogs */
  }
`
