import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router/dist/vue-router';
import '@/assets/css/tailwind.css'
import Home from './components/Home.vue';
import HomeContent from './components/HomeContent.vue';
import AddCategory from './components/AddCategory.vue';
import Menubar from './components/Menubar.vue';
import Sidebar from './components/Sidebar.vue';

const routes = [
  { path: '/', component: HomeContent },
    { path: '/AddCategory', component: AddCategory },
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