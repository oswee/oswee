import { SystemState } from './models'

export enum SystemTypes {
  SELECT = 'SYSTEM__SELECT',
  LOADED = 'SYSTEM__LOADED',
}

interface Select {
  readonly type: SystemTypes.SELECT
  readonly payload: {
    id: string
  }
}

interface Loaded {
  readonly type: SystemTypes.LOADED
}

export type SystemActionTypes = Select | Loaded
