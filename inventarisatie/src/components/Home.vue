<template>
        <!-- <div class="flex">
            <Sidebar />
        <div class="flex flex-col w-full h-[100vh]" @click.prevent="toggle(true)">
            <Menubar /> -->
                <!-- Page Content -->
                <div class="h-full">
                    <!-- <router-view></router-view> -->
                    <p class="h1">{{welcomeMessage}}</p> <!-- later in backend -->
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categorie
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="categoryButton">
                            <a class="dropdown-item" @click="createTableContent('Motherbord')" href="#">Moederborden</a>
                            <a class="dropdown-item" href="#">CPU's</a>
                            <a class="dropdown-item disabled" href="#">Voedingen</a>
                            <a class="dropdown-item disabled" href="#">Kasten</a>
                            <a class="dropdown-item disabled" href="#">RAM</a>
                            <a class="dropdown-item disabled" href="#">Koelers</a>
                            <a class="dropdown-item disabled" href="#">Uitbreidingskaarten</a>
                        </ul>
                    </div>
                    <div id="tableContent">
                    <!-- <table id="tableMotherbord" class="table table-striped table-bordered">
                        <thead class="bg-dark">
                        <tr>
                            <th scope="col">Naam</th>
                            <th scope="col">Socket</th>
                            <th scope="col">Chipset</th>
                            <th scope="col">Formaat</th>
                            <th scope="col">Locatie</th>
                            <th scope="col">Opmerkingen</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td scope="row">{{inventoryName}}</td>
                                <td>{{inventorySocket}}</td>
                                <td>{{inventoryChip}}</td>
                                <td>{{inventoryFormat}}</td>
                                <td>{{inventoryLocation}}</td>
                                <td>{{inventoryComment}}</td>
                            </tr>
                        </tbody>
                    </table> -->
                    </div>
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
                // inventoryName: 'HP531965-001 PRO',
                // inventorySocket: 'LGA775',
                // inventoryChip: 'Q43',
                // inventoryFormat: 'WTX?',
                // inventoryComment: '',
                // inventoryLocation: 'opslag'
            };
        },
        methods: {
            toggle(closeOnly) {
                if (!closeOnly) {
                    this.open = !this.open;
                    return;
                }
                this.open = false;
            },
            async createTableContent(tableName) {
                const requestOptions = {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ tableName: tableName })
                    };
                    const response = await fetch("http://localhost:8000/TableTotal", requestOptions);
                    console.log(response);
                    const data = await response.json();
                    console.log(data);
            },
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