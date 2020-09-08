<template>
  <div id="docs">
    <h2>The URL Shorten API</h2>
    <p>This API allows users to create short URLs that redirects to a more complex URL destination. </p>
    <p>For example: 'https://www.google.com' could be shortened to 'https://rurls/go/abc123'.<br>
    Unfortunately, I'm just a student, so I can't afford the domain name 'rurls'. Then I have to use the domain provided by Heroku: rurls.herokuapp.com
    </p>
    <h2>Using the API</h2>
    <p>You'll need:<br>1 - User Account<br>2 - API Key<br>3 - Any HTTP request software</p>
    <p>First, create your account and generate your API Key. Both can be made on the API Key section.</a><br>
    After that, you can use your API Key to make request to the server.<br>
    </p>  
    <h2>End Points</h2>
    <p>Create a new URL</p>
    <label>
    <i class="ps">POST</i> http://rurls/api/v1/urls <br>
    <i class="pr">Params</i><br>
    <i class="circle"></i> api_key → Your own API Key <small>required</small><br>
    <i class="circle"></i> destination → Where dooes the URL points to. (i.e https:google.com) <small>required</small><br>
    <i class="res">Response</i> Status: 200 <br>
<pre>
  {
      url: {
          id: Integer
          user_id: Integer,
          key_id: String,
          full_url: String,
          description: String,
          created_at: Date,
          updated_at: Date,
      },
  }
</pre>
    </label>
    <br>
    <p>Get all URLs created by the User</p>
    <label>
    <i class="bl">GET</i> http://rurls/api/v1/urls <br>
    <i class="pr">Params</i><br>
    <i class="circle"></i> api_key → Your own API Key <small>required</small><br>
    <i class="res">Response</i> Status: 200 <br>
<pre>
  {
      url: {
          id: Integer
          user_id: Integer,
          key_id: String,
          full_url: String,
          description: String,
          created_at: Date,
          updated_at: Date,
      },
  }
</pre>
    </label>
    <br>
    <p>Get one single URL created by the User</p>
    <label>
    <i class="bl">GET</i> http://rurls/api/v1/urls/:id <br>
    <i class="pr">Params</i><br>
    <i class="circle"></i> api_key → Your own API Key <small>required</small><br>
    <i class="circle"></i> id → The ID of the URL <small>required</small><br>
    <i class="res">Response</i> Status: 200 <br>
<pre>
  {
      url: {
          id: Integer
          user_id: Integer,
          key_id: String,
          full_url: String,
          description: String,
          created_at: Date,
          updated_at: Date,
      },
  }
</pre>
    </label>
    <br>
    <p>Update the destination of one single URL created by the User</p>
    <label>
    <i class="pu">PUT</i> http://rurls/api/v1/urls/:id <br>
    <i class="pr">Params</i><br>
    <i class="circle"></i> api_key → Your own API Key <small>required</small><br>
    <i class="circle"></i> id → The ID of the URL <small>required</small><br>
    <i class="circle"></i> destination → The new Destination of the URL <small>required</small><br>
    <i class="res">Response</i> Status: 201 <br>
<pre>
  {
      url: {
          id: Integer
          user_id: Integer,
          key_id: String,
          full_url: String,
          description: String,
          created_at: Date,
          updated_at: Date,
      },
  }
</pre>
<pre>
  {}
</pre>
    </label>
    <br>
    <p>Delete one single URL created by the User</p>
    <label>
    <i class="dl">DELETE</i> http://rurls/api/v1/urls/:id <br>
    <i class="pr">Params</i><br>
    <i class="circle"></i> api_key → Your own API Key <small>required</small><br>
    <i class="circle"></i> id → The ID of the URL <small>required</small><br>
    <i class="res">Response</i> Status: 201 <br>
<pre>
  {}
</pre>
    </label>
    <h2>API Key</h2>
    <p>Your API Key it's a Hash created with HS256, using your credentials (e-mail and password) and a very special (and secret), really big, number.<br>
    Like this: HS256( { e-mail, password }, secret_number ) = API_Key<br>
    With this API_Key, I can get your credentials. And I also now if the API_Key is corrupted or not.<br>
    When you get your API_Key, save it and don't modify it.
    </p>
    <br>
    <p>If you have any questions, 
    <a class="dark" href="mailto:azevedev@gmail.com">
      contact me.
    </a></p>
    <br>
  </div>
</template>
<script>

export default {
  name: "docs"
}
</script>

<style scoped>
small{
  font-size: 0.7em;
  font-style: italic;
}
pre{
  padding: 0;
  margin: 0;
  background: transparent;
  line-height: normal;
}
i{
  font-style: normal;
  display: inline-block;
  line-height: 10px;
  transform: scale(1) !important;
}
.circle{
  content: "";
  border-radius: 50%;
  height: 4px;
  width: 4px;
  border: 2px solid #EF959D;
  background: transparent;
}
p {
  font-size: 1.2em;
  text-align: center;
  width: 100%;
  line-height: 20px;
  text-align: left;
}

label {
  background: #f2f2f2;
  margin-right: auto;
  padding: 12px;
  border-radius: 12px;
  line-height: 26px;
  font-size: 14px;
  font-family: 'monospace';
}
.bl{
  color: white;
  font-weight: bold;
  background: #489FB5;
  padding: 3px;
  border-radius: 4px;
}
.pr{
  color: white;
  font-weight: bold;
  background: #FF8427;
  padding: 3px;
  border-radius: 4px;
}
.ps{
  color: white;
  font-weight: bold;
  background: #4D8B31;
  padding: 3px;
  border-radius: 4px;
}
.pu{
  color: white;
  font-weight: bold;
  background: #fcaf17;
  padding: 3px;
  border-radius: 4px;
}
.dl{
  color: white;
  font-weight: bold;
  background: #EF271B;
  padding: 3px;
  border-radius: 4px;
}
.res{
  color: white;
  font-weight: bold;
  background: #B388EB;
  padding: 3px;
  border-radius: 4px;
}

</style>
