<template>
  <div id="app">
    <h2>What's this?</h2>
    <p class="red">RUrls is a basic App with and API to shorten URLs, using Rails on the Back-End and Vue-js on the Front-End.
    <br>Source Code <a href="https://www.github.com/azevedomath">here.</a><br>
    If you want to copy this project just follow the git repository instructions.
    I made this just for educational purposes, trying to actually use Vue-js inside Rails.</p>
    <p>For more info about the API, see the docs. You'll need a API Key, and for that you 'need' an account. 
    It's just a simple auth, nothing fancy.</p>
    <h3>Have fun :)</h3>
  </div>
</template>
<script>

export default {
  name: 'home'
}
</script>

<style scoped>
p {
  font-size: 1.2em;
  text-align: center;
  width: 100%;
  line-height: 20px;
  text-align: left;
}
a{
  color: #666;
  transition: .3s;
}
a:hover{
  background: transparent;
  color: black;
}
.red:first-letter {
  color: brown;
}
</style>
