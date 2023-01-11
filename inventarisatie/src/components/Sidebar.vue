<template>
    <div class="inset-0 flex z-40" @click="this.$store.commit('Closepopup')">
        <!-- Sidebar -->
        <div class="flex top-0 h-[100%] z-20"
             :class="[right ? 'right-0 flex-row' : 'left-0 flex-row-reverse'] ">
            <!--Drawer -->
            <div class="w-10 h-full p-1 my-auto rounded-br-lg text-white bg-[#424C6E] text-center focus:outline-none hover:bg-[#55638E] transition-color duration-300 flex flex-col gap-7">
                <button @click.prevent="toggle(false)" class="mt-[3rem] hover:scale-125 duration-300">
                    <img src="@/assets/menu-icon.png" alt="menu">
                </button>
                <router-link to="/Home" class="hover:scale-125 duration-300">
                    <img src="@/assets/home.png" alt="goHome">
                </router-link>
                <router-link to="/AddCategory" class="hover:scale-125 duration-300">
                    <img src="@/assets/plus.png" alt="addModel">
                </router-link>
                <button @click.prevent="" class="hover:scale-125 duration-300">
                    <img src="@/assets/motherboard.png" alt="addComponent">
                </button>
            </div>
            <!-- Sidebar Content -->
            <div ref="content"
                 class="transition-all duration-700 bg-[#424C6E] overflow-hidden flex flex-col gap-7"
                 :class="[open ? 'max-w-lg' : 'max-w-0']">
                <button class="mt-[6.9rem] w-48 text-center font-bold text-[17px] text-black hover:text-[22px] duration-300">
                    Home-Scherm
                </button>
                <button class="w-48 text-center font-bold text-[17px] text-black hover:text-[22px] duration-300">
                    Categorie toevoegen
                </button>
                <button class="w-48 text-center font-bold text-[17px] text-black hover:text-[22px] duration-300">
                    Item toevoegen
                </button>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Sidebar",
        data() {
            return {
                open: false,
                dimmer: true,
                right: false,
                logo: require('../assets/bits&bytes logo.jpg')
            };
        },
        methods: {
            toggle(closeOnly) {
                if (!closeOnly) {
                    this.open = !this.open;
                    return;
                }
                this.open = false;
            }
        }
    };
</script>
