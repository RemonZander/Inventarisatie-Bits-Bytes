import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router/dist/vue-router';
import '@/assets/css/tailwind.css'
import Home from './components/Home.vue';
import HomeContent from './components/HomeContent.vue';
import AddCategory from './components/AddCategory.vue';
import Menubar from './components/Menubar.vue';
import Sidebar from './components/Sidebar.vue';
import LoginScreen from './components/LoginScreen.vue';
import PageNotFound from './components/404.vue';
import Template from './components/Template.vue';

const routes = [
  { path: '/', component: LoginScreen },
  { path: '/AddCategory', component: AddCategory },
  { path: '/Home', component: Home},
  { path: '/template', component: PageNotFound}
]

const router = createRouter({
  history: createWebHistory("/"),
  routes,
})

// const app = createApp(Home)
const app = createApp(Template)

app.component('Menubar', Menubar);
app.component('Sidebar', Sidebar);

app.use(router)

app.mount('#app')