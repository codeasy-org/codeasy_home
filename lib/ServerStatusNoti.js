import { Meteor } from 'meteor/meteor'
import { fetch, Headers } from 'meteor/fetch';

let serverOn = false;

function notiSlackEnd(exitType) {
  let slackUrl = 'https://hooks.slack.com/services/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'
  let message = {
    attachments: [
      {
        fallback: "서버가 종료되었습니다.",
        color: "#ff0000",
        title: "서버가 종료되었습니다.",
        fields: [
          {
            title: "CREVERSE NFT",
            value: exitType,
            short: false
          }
        ],
        ts: new Date().getTime()
      }
    ]
  }
  fetch(slackUrl, {
    method: "POST",
    headers: new Headers({ 'Content-Type': 'application/json' }),
    body: JSON.stringify(message)
  })
  serverOn = false;

}

function notiSlackStart() {
  let slackUrl = 'https://hooks.slack.com/services/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'
  let message = {
    attachments: [
      {
        fallback: "서버가 온라인 상태입니다.",
        color: "#008000",
        title: "서버가 온라인 상태입니다.",
        fields: [
          {
            title: "CREVERSE NFT",
            value: "SERVER START",
            short: false
          }
        ],
        ts: new Date().getTime()
      }
    ]
  }
  fetch(slackUrl, {
    method: "POST",
    headers: new Headers({ 'Content-Type': 'application/json' }),
    body: JSON.stringify(message)
  })
  serverOn = true;
}

if (Meteor.isServer) {
  Meteor.startup(() => {
    if (serverOn) return
    notiSlackStart()
  })
  process.on('exit', () => {
    if (!serverOn) return
    notiSlackEnd('exit')
  });
  process.on('SIGINT', () => {
    if (!serverOn) return
    notiSlackEnd('SIGINT')
  });
  process.on('SIGUSR1', () => {
    if (!serverOn) return
    notiSlackEnd('SIGUSR1')
  });
  process.on('SIGUSR2', () => {
    if (!serverOn) return
    notiSlackEnd('SIGUSR2')
  });
  process.on('uncaughtException', () => {
    if (!serverOn) return
    notiSlackEnd('uncaughtException')
  });
  process.on('SIGQUIT', () => {
    if (!serverOn) return
    notiSlackEnd('SIGQUIT')
  });
  process.on('SIGTERM', () => {
    if (!serverOn) return
    notiSlackEnd('SIGTERM')
  });
}
