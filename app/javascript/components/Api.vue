<template>
  <div id="app">
    <Credentials v-on:getCredentials="userLoggedIn"/>
  </div>
</template>
<script>
import Credentials from "./Credentials.vue"
export default {
  name: 'api',
  data: function() {
      return ({
        logged: false,
        api_key: ""
      })
 },
  components: {Credentials},
  methods: {
    userLoggedIn(){
      console.log("user logged in")
      this.logged = true
    }
  }
}
</script>

<style scoped>
.hide {
  display: none;
}
p {
  font-size: 1.2em;
  text-align: center;
  width: 100%;
  line-height: 20px;
  text-align: left;
}
</style>
