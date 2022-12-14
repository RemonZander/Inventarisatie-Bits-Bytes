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
                                <th scope="col" v-for="key in Object.keys(tableData[0])" :hidden="key === 'ID' ? true : false">{{key}}</th> <!-- key = property -->
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in tableData">                            
                                    <td scope="row" v-for="key in Object.keys(item)" :hidden="key === 'ID' ? true : false">{{tableData[index][key]}}</td>
                                    <td><button id="showModal" @click="(showpopup = !showpopup), popupContent(item)"><img class="h-5 w-5" src="@/assets/editIcon.png"></button></td>
                                    <div v-show="showpopup" class="flex flex-col bg-green-100 absolute border-solid border-4 border-black inset-1/2 w-[35vw] h-1/2 transform -translate-x-1/2 -translate-y-1/2">
                                        <!-- <p v-for="key in Object.keys(itemData)">{{key + ": " + itemData[key]}}</p> -->
                                        <p class="flex flex-row justify-start" v-for="key in Object.keys(itemData)">
                                            <div class="flex flex-row items-center justify-end w-3/4 ml-[1vw]">
                                                <span class="text-left">{{key + ": "}}</span>
                                                <input v-model="itemData[key]" :disabled="key === 'ID' || key === 'UID' ? true : false" class="self-end input-group-addon input-group-text text-left w-[18vw] h-7 mx-1 my-0.5" :class="key === 'ID' || key === 'UID' ? '' : 'bg-white'" maxlength="100"/>
                                            </div>
                                        </p>
                                        <div>
                                            <button class="btn text-center absolute bottom-0 left-0 inset-x-1/2" @click="say('Dit heeft nog geen functie')">Verwijderen</button>
                                            <button class="btn text-center absolute bottom-0 right-0 inset-x-1/2" @click="tableData[index] = itemData; showpopup = !showpopup">Opslaan</button>
                                        </div>
                                    </div>
                                    <!-- v-if checken -->
                                    <!-- knop for acties (stuurt door naar een pagina met hetzelfde informatie over de item, met ook bewerken/verwijderen) -->
                                </tr>
                            </tbody>
                        </table>
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
                itemData: [],
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
            popupContent(item) {
                this.itemData = [];
                const keys = Object.keys(item);
                for (let index = 0; index < keys.length; index++) {
                    this.itemData[keys[index]] = item[keys[index]];
                }             
            },
            enableEdit(key) {
                //document.getElementById(key).
            },
            saveCategory(categoryText) {
                this.categoryText = categoryText;
                console.log(this.categoryText)
            },
            say(message) {
    	        alert(message)
  	        },
            // saveItem(index){
            //     this.tableData[index] = this.itemData;
            //     console.log(index);
            // }
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