import Vue from 'vue'
import VueVuelidateJsonschema from 'vue-vuelidate-jsonschema'
import Vuelidate from 'vuelidate'
import VTooltip from 'v-tooltip'
import VueGoodTablePlugin from 'vue-good-table'
import PortalVue from 'portal-vue'
import logger from 'electron-log'

import { remote, ipcRenderer } from 'electron'
import fs from 'fs'

import i18n from './i18n'
import router from './router/plugin'
import store from './store'
import mixins from './mixins'
import filters from './filters'
import directives from './directives'

import alertEvents from '@/plugins/alert-events'
import apiClient from '@/plugins/api-client'
import synchronizer from '@/plugins/synchronizer'
import eventBus from '@/plugins/event-bus'
import pluginManager from '@/plugins/plugin-manager'

// Must be first to contain an empty Vue instance
Vue.use(pluginManager)

Vue.config.productionTip = false
Vue.logger = Vue.prototype.$logger = logger
Vue.prototype.$eventBus = eventBus

Vue.use(filters)
Vue.use(directives)
Vue.use(VueVuelidateJsonschema)
Vue.use(Vuelidate)
Vue.use(VueGoodTablePlugin)
Vue.use(VTooltip, {
  defaultHtml: false,
  defaultContainer: '#plugin-app'
})
Vue.use(alertEvents)
Vue.use(apiClient)
Vue.use(synchronizer)
Vue.use(PortalVue)

Vue.mixin(mixins)

/* eslint-disable no-new */
new Vue({
  // components: { App },
  i18n,
  router,
  store,
  template: `<div class="plugin-app">
    <div>
      <RouterView class="flex-1 overflow-y-auto" />
    </div>
  </div>`
  // template: '<App/>'
}).$mount('#plugin-app')

ipcRenderer.on('plugin:navigateToRoute', (event, arg) => {
  fs.writeFileSync('/Users/alexbarnsley/desktop-wallet.log', 'plugin system received "plugin:navigateToRoute"', { flag: 'a+' })
  console.log('plugin system received "plugin:navigateToRoute"')
  router.push(arg)
})

remote.getCurrentWindow().webContents.on('plugin:navigateToRoute', (event, arg) => {
  fs.writeFileSync('/Users/alexbarnsley/desktop-wallet.log', 'plugin system remote received "plugin:navigateToRoute"', { flag: 'a+' })
  console.log('plugin system remote received "plugin:navigateToRoute"')
  router.push(arg)
})
console.log('Plugin System Loaded')
