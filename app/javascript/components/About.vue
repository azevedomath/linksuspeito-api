<template>
  <div id="about">
    <h2>Hello!</h2>
    <p>I'm Matheus Azevedo, a Computer Science Student and Web Developer<br>
    If you want to know more about me, those are my socials:<br>
    Git: <a href="https://github.com/azevedomath" target="_blank">azevedomath</a><br>
    LinkedIn: <a href="https://www.linkedin.com/in/azevedomath" target="_blank">azevedomath</a><br>
    Or e-mail me at: 
    <a class="dark" href="mailto:azevedev@gmail.com">
      azevedev@gmail.com
    </a>
    <br>
    </p>
  </div>
</template>
<script>

export default {
  name: "about"
}
</script>

<style scoped>
a{
  color: #666;
  transition: .3s;
}
a:hover{
  background: transparent;
  color: black;
}
p {
  font-size: 1.2em;
  text-align: center;
  width: 100%;
  line-height: 20px;
  text-align: left;
}
</style>
