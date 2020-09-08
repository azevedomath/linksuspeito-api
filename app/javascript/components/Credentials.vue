<template>
  <div id="app">
    <p v-bind:class="{ 'error': error}">{{ message }}</p>
    <p style="word-break: break-all;" v-bind:class="{ 'hide': api_key == ''}">Your Api Key: {{ api_key }}</p>
    <p style="content:''; height: 20px;" v-bind:class="{'hide': message != ''}"><p>
    <h2>Login or Register</h2>
    <p>Provide an e-mail and password to get your API Key. <br>
    If the account already exists, you get your API Key. If not, it gets created.</p>
    <form @submit="getCredentials">
        <div class="form" @click="error=false; message=''; api_key = '';">E-mail:<br> <input type="text" name="email" v-model="email"> </div>
        <div class="form" @click="error=false; message=''; api_key = '';">Password:<br> <input type="password" name="password" v-model="password"></div>
        <button>Get Key</button>
    </form>
  </div>
</template>
<script>
import axios from "axios"
export default {
  name: 'credentials',
  data() {
    return {
      email: '',
      password: '',
      message: '',
      error: false,
      api_key: ''
    }
  }, 
  components: {axios},
  methods: {
    getCredentials(e){
      e.preventDefault()
      axios.post('/credentials?email='+this.email+'&password='+this.password)   
      .then(res => {
        if (!res.data.error){
          this.api_key = res.data.api_key
          this.$emit("getCredentials")
        }
        this.message = res.data.message
        this.error = res.data.error
      })
    }
  }
}
</script>

<style scoped>
.error{
  color: red;
}
.hide{
  display: none;
}
p {
  font-size: 16px;
  text-align: center;
  width: 100%;
  line-height: 20px;
  text-align: left;
}

.form {
    width: 100%;
    margin-bottom: 8px;
}
.form input{
    width: 80%;
    height: 1.4rem;
    border: 1px solid gray;
    border-radius: 8px;
    padding: 2px 14px;
    outline-color: lightblue;
}
button{
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    background: mediumseagreen;
    color: white;
}
</style>
