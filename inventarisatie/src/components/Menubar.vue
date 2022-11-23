<template>
    <div class="bg-[#7486C1] top-0 min-h-[3.5rem] w-full rounded-br-lg">
        <div class="flex items-center justify-between w-full h-full">
            <a class="text-2xl ml-[2rem]">Bits & Bytes inventarisatie</a>
            <input class="mr-[2rem]" type="text" placeholder="Zoek item" />
        </div>
    </div>
</template>

<script>
    export default {
        name: "Menubar",
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