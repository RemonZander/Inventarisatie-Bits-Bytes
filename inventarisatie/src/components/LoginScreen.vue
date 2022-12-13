<template>
    <div class="ml-[25vw] flex flex-col items-center w-[50vw] m-auto">
        <img src="@/assets/logoBitsBytes.jpg">
        <p class="self-center text-5xl my-3">Login</p>
        <div class="flex flex-col bg-green-200 items-center rounded w-3/4 m-2">
        <!-- <div class="flex flex-col ml-[25vw] rounded bg-green-200 w-3/4 h-[100%] flex justify-center pt-[10vh]"> -->
        <form class="w-1/2 m-3">
            <p>Gebruikersnaam</p>
            <input class="w-full border border-black rounded px-2 py-1" placeholder="Vul uw gebruikersnaam" type="text">
            <p class="mt-2">Wachtwoord</p>
            <input class="w-full border border-black rounded px-2 py-1" maxlength="20" placeholder="Vul uw wachtwoord" type="password" required>
            <p class="underline">Wachtwoord vergeten</p>
        </form>
        <router-link class="bg-blue-300 hover:bg-blue-200 px-2 py-2 w-1/4 m-2 rounded text-center" to="/Home">
            <button>Login</button>
        </router-link>
        </div>
    </div>
</template>

<script>

</script>

<style>

</style>

YrDMeaExcUNuHiaplqvV