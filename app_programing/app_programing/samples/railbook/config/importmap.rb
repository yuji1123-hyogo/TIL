# Pin npm packages by running ./bin/importmap

pin "application"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
