import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import RegisterView from '../views/RegisterView.vue'
import LibraryView from '../views/LibraryView.vue'
import PanierView from '../views/PanierView.vue'



const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/registration',
    name: 'registrationForm',
    component: RegisterView
  },

  {
    path: '/library',
    name: 'library',
    component: LibraryView
  },

  {
    path: '/panier',
    name: 'panier',
    component: PanierView
  },


  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
