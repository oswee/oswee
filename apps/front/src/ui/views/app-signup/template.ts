import { html, TemplateResult } from 'lit-element'
// import '../../components/main-taskbar'

export default function template(): TemplateResult {
  return html`
    <div class="container">
      <form id="signup_form" name="signup" method="POST" novalidate action="">
        <h2>Create account</h2>
        <input type="hidden" name="appActionToken" value="JpvLfj2FzMZj2FoVvEDKWR29i80dN5cj3D" />
        <div class="fieldset">
          <label for="customer_name" class="text--sm">Your name</label>
          <input id="customer_name" name="customerName" type="text" />
        </div>
        <div class="fieldset">
          <label for="email" class="text--sm">Email</label>
          <input id="email" name="email" type="text" />
        </div>
        <div class="fieldset">
          <label for="password" class="text--sm">Password</label>
          <input id="password" autocomplete="off" name="password" type="password" />
        </div>
        <div class="fieldset">
          <p class="text--sm">By creating an account, you agree to Oswee's</p>
          <p>
            <a href="/help/conditions_of_use">Conditions of Use</a>
            and
            <a href="/help/privacy_notice">Privacy Notice</a>
          </p>
          <button id="continue" type="submit" class="btn">
            <span class="text--sm">Create your Oswee account</span>
          </button>
        </div>
        <div>
          <p class="text--sm">
            Already have an account?
            <a href="/signin">Sign in</a>
          </p>
        </div>
      </form>
    </div>
  `
}
