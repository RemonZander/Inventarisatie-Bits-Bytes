<template>
    <!-- <div class="h-full">
        <router-view></router-view>
    </div> -->
    <div class="flex flex-col justify-center items-center w-full m-auto">
        <p class="text-5xl my-3">Login</p>
        <form class="flex flex-col w-1/2">
            <label>Gebruikersnaam</label>
            <input class="w-full border border-black rounded px-2 py-1" placeholder="Vul uw gebruikersnaam" type="text">
            <label>Wachtwoord</label>
            <input class="w-full border border-black rounded px-2 py-1" placeholder="Vul uw wachtwoord" type="password" required>
            <p class="underline">Wachtwoord vergeten</p>
        </form>
        <router-link class="bg-blue-300 hover:bg-blue-200 px-2 py-2 w-1/4 m-2 rounded text-center" to="/Home">
            <button>Temporary Enter</button>
        </router-link>

    </div>
</template>

<script>

</script>
