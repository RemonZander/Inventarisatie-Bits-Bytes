<template>
    <div class="ml-[25vw] rounded w-[50vw] h-[100%] flex justify-center pt-[10vh]">
        <div class="flex flex-col gap-6">
            <p class="self-center text-[25px]">Categorie toevoegen</p>
            <div class="input-group mb-3">
                <div class="input-group-addon">
                    <span class="input-group-text" id="basic-addon1">Naam:</span>
                </div>
                <input id="CategoryName" type="text" class="form-control" placeholder="Naam" aria-label="PropertyName" aria-describedby="basic-addon1">
            </div>

            <hr class="my-4 mx-auto w-full h-1 bg-gray-100 rounded border-0 md:my-10 dark:bg-gray-700"/>
            <table class="table text-black">
                <thead class="bg-gray-200">
                    <tr>
                        <th scope="col">Eigenschap</th>
                        <th scope="col">DataType</th>
                    </tr>
                </thead>
                <tbody v-for="eigenschap in Eigenschappen">
                    <tr>
                        <th scope="row">
                            <div class="input-group mb-3">
                                <input v-model="eigenschap.eigenschap" class="form-control placeholder-black bg-inherit text-black" v-bind:id="'eigenschap' + eigenschap.pos" @keyup.enter="Saveproperty(eigenschap.pos)"  type="text" placeholder="Eigenschap toevoegen..." aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                        </th>
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
                        <th scope="row">
                            <div class="input-group mb-3">
                                <input id="eigenschap_new" @keyup.enter="Saveproperty(-1)"  type="text" class="form-control placeholder-black bg-inherit text-black" placeholder="Eigenschap toevoegen..." aria-label="PropertyName" aria-describedby="basic-addon1">
                            </div>
                        </th>
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
                if (document.getElementById('CategoryName').value != "") {
                    const requestOptions = {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ name: document.getElementById('CategoryName').value, values: "test1 varchar(255), test2 varchar(255)" })
                    };
                    const response = await fetch("http://localhost:8000/newTable", requestOptions);
                    const data = await response.json();
                    console.log(data);
                }          
            }
        }
    }
</script>
