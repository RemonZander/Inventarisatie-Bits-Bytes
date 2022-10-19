<template> 
        <!-- Sidebar -->
        <div class="flex">
            <Sidebar />

            <!-- Menubar -->
            <div class="flex flex-col w-full h-[100vh]" @click.prevent="toggle(true)">
                <Menubar />

                <!-- Page Content -->
                <div class="h-full">
                    <router-view></router-view>
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

<style>
    html {
        background: #FAF7F7;
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