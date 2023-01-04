<template>
    <div class="bg-[#7486C1] top-0 min-h-[3.5rem] w-full rounded-br-lg" @click="this.$store.commit('Closepopup')">
        <div class="flex items-center justify-between w-full h-full">
            <a class="text-2xl ml-[2rem]">Bits & Bytes inventarisatie</a>
            <div>
                <input id="searchBox" v-on:keyup.enter="onSearch" class="mr-[2rem]" type="text" placeholder="Zoek item" />
                <router-link class="bg-gray-300 px-2 py-1 w-1/4 rounded mr-[2rem]" to="/">Logout</router-link>
            </div>
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
                logo: require('../assets/bits&bytes logo.jpg'),
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
            onSearch(){
                const searchKey = document.getElementById('searchBox').value.toLowerCase();
                if (searchKey == "" && this.$store.state.tempTableData.length > 0){
                    this.$store.state.tableData = this.$store.state.tempTableData;
                    this.$store.state.tempTableData = [];
                    return;
                }
                const keys = Object.keys(this.$store.state.tableData[0]);
                let searchData = [];
                console.log(searchKey);
                console.log(keys);

                for (let index = 0; index < this.$store.state.tableData.length; index++) {
                   for (let keyIndex = 0; keyIndex < keys.length; keyIndex++) {
                        if (this.$store.state.tableData[index][keys[keyIndex]].toString().toLowerCase().includes(searchKey)){
                            searchData.push(this.$store.state.tableData[index]);
                            break;
                        } else {
                            console.log('test')
                        }                      
                   }                 
                }
                console.log(searchData);
                this.$store.state.tempTableData = this.$store.state.tableData;
                this.$store.state.tableData = searchData;
            },
        }
    };
</script>