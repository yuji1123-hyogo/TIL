# Pin npm packages by running ./bin/importmap

pin "application"
# pin "vue" # @3.4.21
pin "vue", to: "https://ga.jspm.io/npm:vue@3.4.21/dist/vue.esm-browser.js"

pin_all_from 'app/javascript/components', under: 'components'
