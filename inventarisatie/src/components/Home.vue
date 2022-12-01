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
                            {{categoryText}}
                        </button>
                        <!-- idee: het zichtbaar maken van op welk categorie je zit te kijken -->
                        <ul class="dropdown-menu" aria-labelledby="categoryButton" @click="(showpopup = close)"> 
                            <a class="dropdown-item" @click="createTableContent('Motherbord'), saveCategory('Moederborden')" href="#">Moederborden</a>
                            <a class="dropdown-item" @click="createTableContent('CPUs'), saveCategory(`CPU's`)" href="#">CPU's</a>
                            <a class="dropdown-item" @click="createTableContent('PSUs'), saveCategory(`Voedingen`)" href="#">Voedingen</a>
                            <a class="dropdown-item" @click="createTableContent('PC_Cases'), saveCategory(`Kasten`)" href="#">Kasten</a>
                            <a class="dropdown-item disabled" href="#">RAM</a>
                            <a class="dropdown-item" @click="createTableContent('Coolers'), saveCategory(`Koelers`)" href="#">Koelers</a>
                            <a class="dropdown-item disabled" href="#">Uitbreidingskaarten</a>
                            <a class="dropdown-item disabled" href="#">HDD's en SDD's</a>
                            <a class="dropdown-item disabled" href="#">Switches</a>
                            <!-- Uitbreidingskaarten, HDD, SDD, Routers en Switches hebben nog geen data in database-->
                        </ul>
                    </div>
                    <div id="tableContent">
                        <div class="overflow-y-scroll h-[75vh]">                   
                        <table class="table-striped table-bordered w-full">
                            <thead class="bg-dark">
                            <tr>
                                <th scope="col" v-for="key in Object.keys(tableData[0])">{{key}}</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in tableData">                             
                                    <td scope="row" v-for="key in Object.keys(item)">{{tableData[index][key]}}</td>
                                    <td><button id="showModal" @click="(showpopup = !showpopup)">test</button></td>
                                    <!-- knop for acties (stuurt door naar een pagina met hetzelfde informatie over de item, met ook bewerken/verwijderen) -->
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        <div v-show="showpopup" class="bg-green-100 absolute border-solid border-4 border-black inset-1/2 w-1/2 h-1/2  transform -translate-x-1/2 -translate-y-1/2">
                            <h1>hoi</h1>
                            <button class="btn text-center absolute bottom-0 inset-x-40" @click="(showpopup = close)">Sluiten</button>
                        </div>
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
                categoryText: 'kies categorie...',
                showpopup: false
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
                    console.log(this.tableData);
            },
            saveCategory(categoryText) {
                this.categoryText = categoryText;
                console.log(this.categoryText)
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