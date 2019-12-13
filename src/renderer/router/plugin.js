import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// NOTE: when adding a route here, check the `KeepAliveRoutes` computed property
// of `App.vue`: only routes that do not depend on params or the profile should be kept alive
const router = new Router({
  routes: [
    {
      path: '/',
      name: 'main',
      component: require('@/pages/Placeholder').default
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})

export default router
