import Vue from 'vue'
import Router from 'vue-router'
import Login from '../views/login'

Vue.use(Router)

export default new Router({
  routes: [
    {
      // Login Page
      path: '/login',
      name: 'Login',
      component: Login
    }
  ]
})
