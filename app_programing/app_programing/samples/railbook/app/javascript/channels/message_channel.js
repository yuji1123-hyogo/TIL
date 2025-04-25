import consumer from "channels/consumer"

const btn = document.querySelector('#btn');
const body = document.querySelector('#body');
const name = document.querySelector('#name');
const messages = document.getElementById('messages');
const paths = location.href.split('/');
const topic = paths[paths.length - 1];

// const app = consumer.subscriptions.create('MessageChannel', {
//   received(data) {
//     const p = document.createElement('p');
//     p.textContent = `${data.name}：${data.body}`;
//     messages.prepend(p);
//   },
//   sendMessage(name, msg) {
//     return this.perform('sendMessage', { name: name, body: msg });
//   }
// });


// トピックを分割する場合
const app = consumer.subscriptions.create(
  { channel: 'MessageChannel', topic }, {
  received(data) {
    const p = document.createElement('p');
    p.textContent = `${data.name}：${data.body}`;
    messages.prepend(p);
  },
  sendMessage(topic, name, body) {
    return this.perform('sendMessage', { topic, name, body });
  }
});

if (btn) {
  btn.addEventListener('click', function(e) {
    e.preventDefault();
    // app.sendMessage(name.value, body.value);
    app.sendMessage(topic, name.value, body.value);
    body.value = '';
  }, false);
}
