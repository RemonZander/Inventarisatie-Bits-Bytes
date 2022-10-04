<template> 
        <!-- Sidebar -->
        <div class="flex">
            <Sidebar />

            <!-- Menubar -->
            <div class="flex flex-col w-full h-[100vh]" @click.prevent="toggle(true)">
                <Menubar />

                <!-- Page Content -->
                <div>
                    <div class="absolute inset-1/2 rounded bg-green-500 w-1/2 h-1/2 transform -translate-x-1/2 -translate-y-1/2 flex justify-center items-center text-white">
                        Page Content
                    </div>
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