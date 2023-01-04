<template>
            <!-- Page Content -->
                <div class="h-full" @click="this.$store.commit('Closepopup')">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle m-2" type="button" id="categoryButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {{categoryText}}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="categoryButton"> 
                            <a class="dropdown-item" @click="createTableContent('Motherbord'), categoryText = 'Moederborden'" href="#">Moederborden</a>
                            <a class="dropdown-item" @click="createTableContent('CPUs'), categoryText = `CPU's`" href="#">CPU's</a>
                            <a class="dropdown-item" @click="createTableContent('PSUs'), categoryText = 'Voedingen'" href="#">Voedingen</a>
                            <a class="dropdown-item" @click="createTableContent('PC_Cases'), categoryText = 'Kasten'" href="#">Kasten</a>
                            <a class="dropdown-item disabled" href="#">RAM</a>
                            <a class="dropdown-item" @click="createTableContent('Coolers'), categoryText = 'Koelers'" href="#">Koelers</a>
                            <a class="dropdown-item disabled" href="#">Uitbreidingskaarten</a>
                            <a class="dropdown-item disabled" href="#">HDD's en SDD's</a>
                            <a class="dropdown-item disabled" href="#">Switches</a>
                            <!-- Uitbreidingskaarten, HDD, SDD, Routers en Switches hebben nog geen data in database-->
                        </ul>
                    </div>
                    <div id="tableContent">
                        <div class="overflow-y-auto m-2 h-[80vh]">                   
                        <table class="table-striped table-bordered w-full">
                            <thead class="bg-dark">
                            <tr>
                                <th scope="col" v-for="key in Object.keys(this.$store.state.tableData[0])" :hidden="key === 'ID' ? true : false">{{key}}</th> <!-- key = property -->
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in this.$store.state.tableData">                            
                                    <td scope="row" v-for="key in Object.keys(item)" :hidden="key === 'ID' ? true : false">{{this.$store.state.tableData[index][key]}}</td>
                                    <td><button id="showModal" @click="popupContent(item, index)"><img class="h-5 w-5" src="@/assets/editIcon.png"></button></td>
                                    <div v-show="this.$store.state.showpopup" class="flex flex-col bg-green-100 absolute border-solid border-4 border-black inset-1/2 w-[35vw] h-1/2 transform -translate-x-1/2 -translate-y-1/2" @click="this.$store.state.popupInteraction = true;">
                                        <p class="flex flex-row justify-start" v-for="key in Object.keys(itemData)">
                                            <div class="flex flex-row items-center justify-end w-3/4 ml-[1vw]">
                                                <span class="text-left">{{key + ": "}}</span>
                                                <input v-model="itemData[key]" :disabled="key === 'ID' || key === 'UID' ? true : false" class="self-end input-group-addon input-group-text text-left w-[18vw] h-7 mx-1 my-0.5" :class="key === 'ID' || key === 'UID' ? '' : 'bg-white'" maxlength="100"/>
                                            </div>
                                        </p>
                                        <div>
                                            <button class="btn text-center absolute bottom-0 left-0 inset-x-1/2" @click="confirmRemoveItem()">Verwijderen</button>
                                            <button class="btn text-center absolute bottom-0 right-0 inset-x-1/2" @click="saveItem()">Opslaan</button>
                                            <!-- bevestigingsscherm nodig -->
                                            <p id="confirmation"></p>
                                        </div>
                                    </div>
                                    <!-- v-if checken -->
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
                itemData: [],
                categoryText: 'kies categorie...',
                recordNumber: 0,
                selectedTable: '',
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
                this.$store.state.tempTableData = [];
                this.selectedTable = tableName;
                const requestOptions = {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ tableName: tableName })
                    };
                    const response = await fetch("http://localhost:8000/TableTotal", requestOptions);
                    this.$store.state.tableData = await response.json();
                    console.log(this.$store.state.tableData);
            },
            popupContent(item, index) {
                this.$store.state.popupInteraction = true;
                this.itemData = [];
                const keys = Object.keys(item);
                for (let index = 0; index < keys.length; index++) {
                    this.itemData[keys[index]] = item[keys[index]];
                };
                this.recordNumber = index;
                this.$store.state.showpopup = true;
            },
            saveItem(){
                this.$store.state.tableData[this.recordNumber] = this.itemData; 
                this.$store.commit('Closepopup'); 
            },
            async removeItem(){
                const requestOptions = {
                        method: "DELETE",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ tableName: this.selectedTable, UID: this.itemData.UID })
                };
                const response = await fetch("http://localhost:8000/RemoveComponent", requestOptions);

                this.$store.state.tableData.splice(this.recordNumber, 1);
                this.$store.commit('Closepopup');
                this.itemData = [];

                //setupDatabase.js voor terugbrengen Database
            },
            confirmRemoveItem(){
                if (confirm("Weet u zeker dat u dit wilt verwijderen?")) {
                    this.removeItem()
                } else {

                }
            },
            say(message) {
    	        alert(message);
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