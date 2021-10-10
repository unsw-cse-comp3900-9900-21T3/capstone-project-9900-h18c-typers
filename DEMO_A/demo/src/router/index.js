import Vue from 'vue'
import Router from 'vue-router'
import Login from '../views/login'
import welcome from '../views/welcome'
import sign from '../views/sign'
import Homepage from '../views/Homepage'
import Navbar from '../views/Navbar'
import swiper from '../views/swiper'

Vue.use(Router)

export default new Router({
  routes: [
    {
      // welcome Page
      path: '/',
      name: 'welcome',
      component: welcome
    },
    {
      // Login Page
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      // sign up Page
      path: '/sign',
      name: 'sign',
      component: sign
    },
    {
      // Homepage
      path: '/home',
      name: 'homepage',
      component: Homepage
    },
    {
      // Navbar
      path: '/navbar',
      name: 'Navbar',
      component: Navbar
    },
    {
      // swiper
      path: '/swiper',
      name: 'swiper',
      component: swiper
    }
  ]
})
