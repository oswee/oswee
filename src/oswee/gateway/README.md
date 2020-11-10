# WebSockets

My attempt to create Slack like Teams/Channels architecture.

https://github.com/dzintars/srp/blob/76194cf379eafa3822ba88e3155fde55a6be8c66/clients/router/static/src/js/redux/actions/messages.js

https://www.youtube.com/watch?v=norUcMSJRtQ

https://exec64.co.uk/blog/websockets_with_redux/ (saved in Library)

Important article for dynamic json unmarshalling
https://eagain.net/articles/go-json-kind/ (saved in Library)
Still need to implement Methods instead of type switches.

## Todo

- Rate limiting for messages, nickname changes, etc
- Organization (chatrooms)
- Teams in organizations
- Methods instead of type switches

If there is no session cookie, then we need to force user to sign in

If there is an session cookie, then we just open an connection. Probably we need to track all user sessions because he could use multiple browser tabs or clients.

We should use gorilla secure cookie, because we can easy share encryption key across servers.

We exchange pure actions over wss.

If user are in Order view and there are no other users online in the same order view, then e don't need to create a "chat room" for that order. But as soon as
second user enters the same view, we move booth users in the same connection group???

User roles?

The Hub. What is the Hub? Do i really create a Hub for every single user?

[GitHub Example WSS]()https://github.com/gorilla/websocket/tree/master/examples/chat)

Pool is an object holding all active Hubs.
Every organization with at least one user online have it's own dedicated Hub in that Pool.
Organization Hub is organized in Channels.
Every Channel is a application level View at which every Organization user currently are in.
When last user leaves the current View, that Channel is removed from Hub to clean up the memory and new Channel is created according to the View user navigated to.
If new user joins the View where other user is already on, then new user gets joined to existing Channel and further actions/messages are synced between booth users.
Every user can be part of multiple Organization Channels. For example, he can receive Organization wide events while working in Customer or Order level view/Channel.
Every user can be part of multiple Hubs. For example he can receive System wide events (System itself is an Organization) and Organization wide events.

Main target of this organization is to reduce network traffic and broadcast/receive only what is really required for communications. There is no need to broadcast messages if there is no relative/authorized consumer.

## Articles

https://www.hascode.com/2016/10/writing-a-websocket-chat-in-go/comment-page-1/#comment-7064

[Chat Rooms](https://github.com/gorilla/websocket/issues/46#issuecomment-227906715)

[Go JSON unmarshaling based on an enumerated field value](https://eagain.net/articles/go-json-kind/)

## GitHub

## Use

`go generate` to generate jsonenums

`go run *.go -addr :9090` to run the server
