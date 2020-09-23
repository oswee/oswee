import { html, TemplateResult } from 'lit-element'

export default function template(): TemplateResult {
  return html`
    <div class="container">
      <h1>Create new account</h1>
      <p>Welcome to Oswee</p>
      <form id="signin_form" name="signin" novalidate action="">
        <section>
          <label for="user_name">Your name</label>
          <input id="user_name" name="userName" type="text" />
        </section>
        <section>
          <label for="user_email">Email</label>
          <input id="user_email" name="userEmail" type="email" />
        </section>
        <section>
          <label for="password">Password</label>
          <input id="password" autocomplete="off" name="password" type="password" />
        </section>
        <div>
          <p>By creating an account, you agree to Oswee's</p>
          <p>
            <a href="/help/conditions_of_use">Conditions of Use</a>
            and
            <a href="/help/privacy_notice">Privacy Notice</a>
          </p>
          <button class="btn btn--lg btn--block btn--secondary" id="continue">Sign Up</button>
        </div>
        <div>
          <p class="have-account">
            Already have an account?
            <a class="btn btn--lg btn--block btn--success" @click="${this.onSignIn}">Sign In</a>
          </p>
        </div>
      </form>
    </div>
  `
}
