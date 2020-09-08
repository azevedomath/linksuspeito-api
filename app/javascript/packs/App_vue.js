import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'

import Home from '../components/Home.vue'
import Docs from '../components/Docs.vue'
import About from '../components/About.vue'
import Api from '../components/Api.vue'
// import Login from '../components/Login.vue'
// import Registration from '../components/Registration.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    { path: '/', component: Home },
    { path: '/docs', component: Docs },
    { path: '/about', component: About },
    { path: '/api', component: Api }
  ]
});

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    router,
    template: `
    <div id="app">
      <p style="display:flex;">
        <router-link to="/" class="lr">
          <i class="gg-home-alt"></i>
          Home
        </router-link>
        <router-link to="/docs" class="lr">
          <i class="gg-file-document" style="margin-right: 2px"></i> Docs
        </router-link>
        <router-link to="/about" class="lr">
          <i class="gg-info"></i>
          About me
        </router-link>

        <router-link to="/api" class="lr">
          <i class="gg-keyhole"></i>
          API Key
        </router-link>

      </p>
      
      <router-view></router-view>
      
    </div>
    `,
  }).$mount("#app");
});

