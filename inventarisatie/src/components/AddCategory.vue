<template>
    <div class="ml-[25vw] rounded bg-green-500 w-[50vw] h-[100%] flex justify-center pt-[10vh]">
        <div class="flex flex-col gap-6">
            <p class="self-center text-[25px]">Categorie toevoegen</p>
            <div class="flex flex-row justify-between"><a>Naam:</a><input class="ml-[1vw]" type="text" id="NaamCategorie" placeholder="Naam categorie" /></div>
            <div v-for="item in items">
                <div class="flex flex-row justify-between"><a>{{ item.item }}</a><input class="ml-[1vw]" type="text" value="" /></div>
            </div>
            <div class="text-[18px] self-center">Eigenschap toevoegen</div>
            <div class="flex flex-row justify-between"><a>Naam eigenschap:</a><input class="ml-[1vw]" type="text" id="NaamEigenschap" placeholder="Naam eigenschap" /></div>
            <button @click.prevent="addItem()">toevoegen</button>
            <button class="text-[20px] mt-[10vh]" @click.prevent="sendRequest()">Categorie toevoegen</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "AddCategory",
        data() {
            return {
                items: []
            };
        },
        methods: {
            addItem() {
                let value = document.getElementById('NaamEigenschap').value;
                if (value != "") {
                    this.items.push({ item: document.getElementById('NaamEigenschap').value });
                    document.getElementById('NaamEigenschap').value = "";
                }
            },
            async sendRequest() {
                if (document.getElementById('NaamCategorie').value != "") {
                    const requestOptions = {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ name: document.getElementById('NaamCategorie').value, values: "test1 varchar(255), test2 varchar(255)" })
                    };
                    const response = await fetch("http://localhost:8000/newTable", requestOptions);
                    const data = await response.json();
                    console.log(data);
                }          
            }
        }
    }
</script>
