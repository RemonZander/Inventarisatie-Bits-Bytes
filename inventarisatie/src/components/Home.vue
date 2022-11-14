<template>
        <!-- <div class="flex">
            <Sidebar />
        <div class="flex flex-col w-full h-[100vh]" @click.prevent="toggle(true)">
            <Menubar /> -->
                <!-- Page Content -->
                <div class="h-full">
                    <!-- <router-view></router-view> -->
                    <p class="h1">{{welcomeMessage}}</p> <!-- later in backend -->
                    <table class="table table-striped table-bordered">
                        <thead class="bg-dark">
                        <tr>
                            <th scope="col">Naam</th>
                            <th scope="col">Socket</th>
                            <th scope="col">Chipset</th>
                            <th scope="col">Formaat</th>
                            <th scope="col">Opmerkingen</th>
                            <th scope="col">Locatie</th>
                        </tr>
                        </thead>
                        <tbody id="inventory">
                            <tr>
                                <td scope="row">{{inventoryName}}</td>
                                <td>{{inventorySocket}}</td>
                                <td>{{inventoryChip}}</td>
                                <td>{{inventoryFormat}}</td>
                                <td>{{inventoryComment}}</td>
                                <td>{{inventoryLocation}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <!-- </div>
        </div> -->
</template>

<script>
    export default {
        name: "Home",
        data() {
            return {
                count: 0,
                open: false,
                dimmer: true,
                right: false,
                logo: require('../assets/bits&bytes logo.jpg'),
                welcomeMessage: 'Welkom',
                inventoryName: 'HP531965-001 PRO',
                inventorySocket: 'LGA775',
                inventoryChip: 'Q43',
                inventoryFormat: 'WTX?',
                inventoryComment: '',
                inventoryLocation: 'opslag'
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
        },
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