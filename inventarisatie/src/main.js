import { createApp } from "vue";
import { createRouter, createWebHistory } from 'vue-router/dist/vue-router';
import '@/assets/css/tailwind.css'
import Home from './components/Home.vue';
import AddCategory from './components/AddCategory.vue';
import Menubar from './components/Menubar.vue';
import Sidebar from './components/Sidebar.vue';
import LoginScreen from './components/LoginScreen.vue';
import PageNotFound from './components/404.vue';
import Template from './components/Template.vue';
import { createStore } from 'vuex'

const routes = [
  { path: '/', component: LoginScreen },
  { path: '/AddCategory', component: AddCategory },
  { path: '/Home', component: Home},
  { path: '/404', component: PageNotFound},
  { path: '/:catchAll(.*)', redirect:'/404'}
]

const router = createRouter({
  history: createWebHistory("/"),
  routes,
})

const store = createStore({
  state () {
    return {
      showpopup: false,
      popupInteraction: false,
      tableData: [{test: "hoi"}],
      tempTableData: [],
      searchUnsuccessfull: false,
    }
  },
  mutations: {
    Closepopup(state){
      if (state.showpopup && !state.popupInteraction){
        state.showpopup = !state.showpopup;
      }
      else if (state.popupInteraction){
        state.popupInteraction = false;
      }
  },
  }
});

// const app = createApp(Home)
const app = createApp(Template);
app.config.globalProperties.showpopup = false;
app.config.globalProperties.popupInteraction = false;

app.component('Menubar', Menubar);
app.component('Sidebar', Sidebar);

app.use(store);
app.use(router);

app.mount('#app');