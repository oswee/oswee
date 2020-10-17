import { html, TemplateResult } from 'lit-element'
import { DynamicModuleLoader } from 'redux-dynamic-modules'
import { repeat } from 'lit-html/directives/repeat'
import { DynamicOrderElement } from './component'
import { StringMap } from '@oswee/libs/action'
// import {connect} from '@oswee/libs/connect'

/**
 * Template for the toppings checkbox used in the Order
 */
interface IToppingCheckboxProps {
  name: string
  orderProps: IOrderProps
}

const ToppingCheckbox = (props: IToppingCheckboxProps) => {
  const { name, orderProps } = props
  const checked = !!orderProps.userPreferences[name]
  const onChange = () => {
    console.log('Checkbox')
    // orderProps.setPreferences({
    //   // Toggle the name property to true/false
    //   [name]: !checked,
    // })
  }
  return html`
    <div>
      <input type="checkbox" id=${name} checked=${checked} @change=${onChange} name=${name} />
      {name}
    </div>
  `
}

export interface IOrderProps {
  userPreferences: StringMap<string | boolean>
  // setPreferences: (preferences: StringMap<string | boolean>) => void
}

/**
 * Component template to list toppings
 * @param props - Test
 * @return {string} Returns template with list of checkboxes
 */
const Order = (props: IOrderProps) => {
  const toppings = ['Cheese', 'Onion', 'Pineapple']
  return html`
    <div>Order</div>
    <ul>
      ${repeat(
        toppings,
        item => item,
        (item, i) => html`${ToppingCheckbox({ name: item, orderProps: props })}`,
      )}
    </ul>
  `
}

export default function template(this: DynamicOrderElement): TemplateResult {
  return html` <h2>Order</h2> `
}
