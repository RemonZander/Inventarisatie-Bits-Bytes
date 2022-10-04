import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router/dist/vue-router';
import '@/assets/css/tailwind.css'
import Home from './components/Home.vue';
import AddModel from './components/AddModel.vue';
import Contact from './components/Contact.vue';
import Menubar from './components/Menubar.vue';
import Sidebar from './components/Sidebar.vue';


const routes = [
  { path: '/', component: Home },
  { path: '/AddModel', component: AddModel },
  { path: '/contact', component: Contact },
]


const router = createRouter({
  history: createWebHistory("/"),
  routes,
})

const app = createApp(Home)

app.component('Menubar', Menubar);
app.component('Sidebar', Sidebar);

app.use(router)

app.mount('#app')