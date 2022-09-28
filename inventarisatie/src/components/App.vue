<template>
    <div id="app">
        <div class="fixed inset-0 flex z-40">
            <!-- Sidebar -->
            <div class="absolute flex top-0 h-screen z-20"
                 :class="[right ? 'right-0 flex-row' : 'left-0 flex-row-reverse']">
                <!--Drawer -->
                <div class="w-10 h-full p-1 my-auto rounded-r-lg text-white bg-gray-600 text-center focus:outline-none hover:bg-gray-500 transition-color duration-300">
                    <button @click.prevent="toggle()">
                        <img src="@/assets/menu-icon.png" alt="menu">
                    </button>
                </div>

                <!-- Sidebar Content -->
                <div ref="content"
                     class="transition-all duration-700 bg-gray-600 overflow-hidden flex items-center justify-center"
                     :class="[open ? 'max-w-lg' : 'max-w-0']">
                    <div class="w-48 text-center font-bold text-xl">Sidebar</div>
                    <slot></slot>
                </div>
            </div>
        </div>

        <!-- Page Content -->

        <div class="absolute inset-1/2 rounded bg-green-500 w-1/2 h-1/2 transform -translate-x-1/2 -translate-y-1/2 flex justify-center items-center text-white">
            Page Content
        </div>

        <div class="absolute bg-gray-200 top-0 right-0 transition-all duration-700" :class="[open ? 'left-[14.5rem]' : 'left-10']">
            <!-- container navbar needed ? <nav class="container px-6 py-8 mx-auto md:flex md:justify-between md:items-center" /> -->
            <div class="flex justify-between">
                <router-link to="/" class="text-xl font-bold text-gray-800 md:text-2xl hover:text-blue-400">
                    Logo
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "App",
        data() {
            return {
                open: false,
                dimmer: true,
                right: false
            };
        },
        methods: {
            toggle() {
                this.open = !this.open;
            }
        }
    };
</script>

<style>
    html {
        background: #efefef;
    }

    .fade-enter-active,
    .fade-leave-active {
        transition: opacity 1s ease-out;
    }

    .fade-enter,
    .fade-leave-to {
        opacity: 0;
    }
</style>