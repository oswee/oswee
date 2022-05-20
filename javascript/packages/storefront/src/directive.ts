import { noChange } from 'lit';
import { AsyncDirective, directive } from 'lit/async-directive.js';
import { Observable, Subscription } from 'rxjs';

class SubscribeDirective extends AsyncDirective {
  observable: Observable<unknown> | undefined;
  sub: Subscription | null = null;

  render(observable: Observable<unknown>) {
    if (this.observable !== observable) {
      this.sub?.unsubscribe();
      this.observable = observable;

      if (this.isConnected) {
        this.subscribe(observable);
      }
    }

    return noChange;
  }

  subscribe(observable: Observable<unknown>) {
    this.sub = observable.subscribe((v: unknown) => {
      this.setValue(v);
    });
  }

  disconnected() {
    this.sub?.unsubscribe();
  }

  reconnected() {
    this.subscribe(this.observable!);
  }
}

export const subscribe = directive(SubscribeDirective);
