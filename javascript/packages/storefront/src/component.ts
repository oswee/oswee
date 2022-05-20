import { LitElement, html } from 'lit';
import { customElement } from 'lit/decorators.js';
import { repeat } from 'lit/directives/repeat.js';
import { BehaviorSubject } from 'rxjs';
import { AsyncController } from './controller';
import { randTodo, Todo } from '@ngneat/falso';

const todos = new BehaviorSubject<Todo[]>([]);

@customElement('app-todos')
export class TodosElement extends LitElement {
  dataSource = new AsyncController(this, todos.asObservable());

  async fetchTodos() {
    // await fetch from server

    todos.next(randTodo({ length: 10 }))
  }

  render() {
    return html`
      <button @click=${this.fetchTodos}>Fetch todos</button>

      <ul>
       ${repeat(this.dataSource.value!,
                todo => todo.id,
                todo => html`<li>${todo.title}</li>`)
       }
      </ul>
    `
  }

}
