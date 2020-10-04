import { html, TemplateResult } from 'lit-element'
import { DynamicModuleLoader } from 'redux-dynamic-modules'
import { repeat } from 'lit-html/directives/repeat'
import { DynamicOrderElement } from './component'
import { StringMap } from '@oswee/libs/action'
import { connect } from '@oswee/libs/connect'
import { IOrderAwareState } from '../../../../modules/orders/contracts'
import { getUserPreferences } from '../../../../modules/settings/selectors'
import { SettingActions } from '../../../../modules/settings/actions'

const toppings = ['Cheese', 'Onion', 'Pineapple']

interface IOrderProps {
  userPreferences: StringMap<string | boolean>
  setPreferences: (preferences: StringMap<string | boolean>) => void
}

const Order = (props: IOrderProps) => {
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

interface IToppingCheckboxProps {
  name: string
  orderProps: IOrderProps
}

const ToppingCheckbox = (props: IToppingCheckboxProps) => {
  const { orderProps, name } = props
  const checked = !!orderProps.userPreferences[name]
  const onChange = () => {
    orderProps.setPreferences({
      [name]: !checked,
    })
  }
  return html`
    <div>
      <input type="checkbox" id=${name} checked=${checked} @change=${onChange} name=${name} />
      {name}
    </div>
  `
}

const mapStateToProps = (state: IOrderAwareState) => {
  return {
    userPreferences: getUserPreferences(state),
  }
}

const ConnectedOrder = connect(mapStateToProps, SettingActions, Order)

export default function template(this: DynamicOrderElement): TemplateResult {
  return html` <p>Test</p> `
}
