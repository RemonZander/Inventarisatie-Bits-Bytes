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
                            <a class="dropdown-item" @click="createTableContent('CPUs')" href="#">CPU's</a>
                            <a class="dropdown-item disabled" href="#">Voedingen</a>
                            <a class="dropdown-item disabled" href="#">Kasten</a>
                            <a class="dropdown-item disabled" href="#">RAM</a>
                            <a class="dropdown-item disabled" href="#">Koelers</a>
                            <a class="dropdown-item disabled" href="#">Uitbreidingskaarten</a>
                        </ul>
                    </div>
                    <div id="tableContent">
                    <table class="table table-striped table-bordered">
                        <thead class="bg-dark">
                        <tr>
                            <th scope="col" v-for="key in Object.keys(tableData[0])">{{key}}</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, index) in tableData">                             
                                <td scope="row" v-for="key in Object.keys(item)">{{tableData[index][key]}}</td>
                            </tr>
                        </tbody>
                    </table>
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
                tableData: [{test: "hoi"}],
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
                    this.tableData = await response.json();
                    // console.log(this.tableData);
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