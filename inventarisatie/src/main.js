import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router/dist/vue-router';
import '@/assets/css/tailwind.css'
import App from './components/App.vue';
import Home from './components/Home.vue';
import About from './components/About.vue';
import Contact from './components/Contact.vue';


const routes = [
  { path: '/', component: Home },
  { path: '/about', component: About },
  { path: '/contact', component: Contact },
]


const router = createRouter({
  history: createWebHistory("/"),
  routes,
})

const app = createApp(App)

app.use(router)

app.mount('#app')
