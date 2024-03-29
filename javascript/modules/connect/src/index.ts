// Original Source: https://github.com/CaptainCodeman/redux-connect-element/blob/master/src/connect.ts

import { Unsubscribe, Store, Action } from 'redux'

export type DispatchMap = { [key: string]: (event: Event) => void }

export interface ConnectProps {
	mapState?(state: any): { [key: string]: any }
}

export interface ConnectEvents {
	mapEvents?(): { [key: string]: (event: Event) => Action }
}

export interface Connectable extends HTMLElement, ConnectProps, ConnectEvents {
	connectedCallback?(): void
	disconnectedCallback?(): void
}

export type Constructor<T> = new (...args: any[]) => T

const unsubscribe: unique symbol = Symbol()
const dispatchMap: unique symbol = Symbol()
const createDispatchMap: unique symbol = Symbol()
const addEventListeners: unique symbol = Symbol()
const removeEventListeners: unique symbol = Symbol()
const addStateSubscription: unique symbol = Symbol()
const removeStateSubscription: unique symbol = Symbol()
const onStateChange: unique symbol = Symbol()

export function connect<T extends Constructor<Connectable>>(store: Store, superclass: T) {
	class connected extends superclass {
		private [unsubscribe]!: Unsubscribe
		private [dispatchMap]!: DispatchMap

		constructor(...args: any[]) {
			super(...args)
			this[createDispatchMap]()
		}

		override connectedCallback() {
			if (super.connectedCallback) {
				super.connectedCallback()
			}

			this[addEventListeners]()
			this[addStateSubscription]()
		}

		override disconnectedCallback() {
			this[removeStateSubscription]()
			this[removeEventListeners]()

			if (super.disconnectedCallback) {
				super.disconnectedCallback()
			}
		}

		private [createDispatchMap]() {
			this[dispatchMap] = <DispatchMap>{}
			if (this.mapEvents) {
				const eventMap = this.mapEvents()
				for (const key in eventMap) {
					this[dispatchMap][key] = (event: Event) => store.dispatch(eventMap[key](event))
				}
			}
		}

		private [addEventListeners]() {
			for (const key in this[dispatchMap]) {
				this.addEventListener(key, this[dispatchMap][key], false)
			}
		}

		private [removeEventListeners]() {
			for (const key in this[dispatchMap]) {
				this.removeEventListener(key, this[dispatchMap][key], false)
			}
		}

		private [addStateSubscription]() {
			this[unsubscribe] = store.subscribe(this[onStateChange].bind(this))
			this[onStateChange]()
		}

		private [removeStateSubscription]() {
			this[unsubscribe] && this[unsubscribe]()
			this[unsubscribe] = null as any
		}

		private [onStateChange]() {
			this.mapState && Object.assign(this, this.mapState(store.getState()))
		}
	}

	return connected as Constructor<Connectable> & T
}
