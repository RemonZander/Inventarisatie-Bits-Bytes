<template>
    <div class="ml-[25vw] rounded bg-green-500 w-[50vw] h-[100%] flex justify-center pt-[10vh]">
        <div class="flex flex-col gap-6">
            <p class="self-center text-[25px]">Categorie toevoegen</p>
            <div class="flex flex-row justify-between"><a>Naam:</a><input class="ml-[1vw]" type="text" id="NaamCategorie" placeholder="Naam categorie" /></div>


            <table class="table text-black">
                <thead>
                    <tr>
                        <th scope="col">Eigenschap</th>
                        <th scope="col">DataType</th>
                    </tr>
                </thead>
                <tbody v-for="eigenschap in Eigenschappen">
                    <tr>
                        <th scope="row"><input v-bind:id="'eigenschap' + eigenschap.pos" @keyup.enter="Saveproperty(eigenschap.pos)" type="text" class="placeholder-black bg-inherit text-black" v-model="eigenschap.eigenschap" /></th>
                        <td>
                            <div v-bind:id="'dropdown' + eigenschap.pos" class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{eigenschap.datatype}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" v-on:click="SaveDataType(eigenschap.pos, 'text')">text</a>
                                    <a class="dropdown-item" v-on:click="SaveDataType(eigenschap.pos, 'getal')">getal</a>
                                    <a class="dropdown-item" v-on:click="SaveDataType(eigenschap.pos, 'datum')">datum</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <th scope="row"><input id="eigenschap_new" @keyup.enter="Saveproperty(-1)" type="text" class="placeholder-black bg-inherit text-black" placeholder="Eigenschap toevoegen..." /></th>
                        <td>
                            <div id="dropdown_new" class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{DropDownText}}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" v-on:click="SaveDataType(-1, 'text')">text</a>
                                    <a class="dropdown-item" v-on:click="SaveDataType(-1, 'getal')">getal</a>
                                    <a class="dropdown-item" v-on:click="SaveDataType(-1, 'datum')">datum</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <button class="text-[20px] mt-[10vh]" @click.prevent="sendRequest()">Categorie toevoegen</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "AddCategory",
        data() {
            return {
                Eigenschappen: [{ pos: 0, eigenschap: "test123", datatype: "text" }],
                DropDownText: "kies datatype...",
            };
        },
        methods: {
            Saveproperty(pos) {
                if (pos === -1 && this.DropDownText === "kies datatype...") {
                    return;
                }
                else if (pos === -1) {
                    this.Eigenschappen.push({ pos: this.Eigenschappen[this.Eigenschappen.length - 1].pos + 1, eigenschap: document.getElementById("eigenschap_new").value, datatype: this.DropDownText });
                    this.DropDownText = "kies datatype...";
                    document.getElementById("eigenschap_new").value = "";                   
                    console.log(this.Eigenschappen);
                    return;
                }
                this.Eigenschappen[pos].eigenschap = document.getElementById("eigenschap" + pos).value;
                console.log(this.Eigenschappen);
            },
            SaveDataType(pos, datatype) {
                if (pos === -1 && document.getElementById("eigenschap_new").value === "") {
                    this.DropDownText = datatype;
                    return;
                }
                else if (pos === -1) {
                    this.Eigenschappen.push({ pos: this.Eigenschappen[this.Eigenschappen.length - 1].pos + 1, eigenschap: document.getElementById("eigenschap_new").value, datatype: this.DropDownText });
                    this.DropDownText = "kies datatype...";
                    document.getElementById("eigenschap_new").value = "";
                    console.log(this.Eigenschappen);
                    return;
                }
                this.Eigenschappen[pos].datatype = datatype;
                console.log(this.Eigenschappen);
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
